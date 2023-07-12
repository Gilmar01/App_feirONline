import re
from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated

from .models import CustomUser
from .accounts_serializers import (
    UserSerializer, MudaSenhaSerializer, UserSerializerUpdateDelete,
    BuscaUserEmailWhatsappSerializer, RedefineSenhaSerializer
)

class CreateUserAPI(generics.CreateAPIView):

    queryset = CustomUser.objects.all().order_by("-id")
    serializer_class = UserSerializer


class UserUpdateAPIView(generics.UpdateAPIView):
    """ Endpoint para o usuário editar seus dados"""
    permission_classes = [IsAuthenticated]

    queryset = CustomUser
    serializer_class = UserSerializerUpdateDelete
    
    def get_object(self):
        return self.request.user

    def perform_update(self, serializer):
        serializer.save()


class UserDeleteAPIView(generics.DestroyAPIView):
    """ Endpoint para o usuário deletar su aconta"""
    permission_classes = [IsAuthenticated]

    queryset = CustomUser
    serializer_class = UserSerializerUpdateDelete
    
    def get_object(self):
        return self.request.user

class UserLogadoInfoAPI(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        try:
            user = request.user
            serializer = UserSerializer(user)
            return Response(serializer.data)
        except:
            return Response({"error": "Algo deu errado."}, status=500)

class MudaSenhaView(generics.UpdateAPIView):

    queryset = CustomUser.objects.all()
    permission_classes = [IsAuthenticated]
    serializer_class = MudaSenhaSerializer

    def get_object(self):
        return self.request.user

class ObtemUserPeloEmailWhatsapp(generics.GenericAPIView):
    serializer_class = BuscaUserEmailWhatsappSerializer

    def post(self, request, *args, **kwargs):
        serailizer = self.get_serializer(data=request.data)
        serailizer.is_valid(raise_exception=True)
        email = serailizer.validated_data['email']
        whatsapp = serailizer.validated_data['whatsapp']

        if email and whatsapp:
            try:
                user = CustomUser.objects.get(email=email, whatsapp=whatsapp)
                return Response({"id": user.id}, status=200)
            except CustomUser.DoesNotExist:
                return Response({"error": "Usuário não encontrado."}, status=404)
        else:
            return Response({"error": "Parâmetros de busca inválidos."}, status=400)


class RdefineSenhaUser(generics.GenericAPIView):
    serializer_class = RedefineSenhaSerializer

    def post(self, request, *args, **kwargs):
        serailizer = self.get_serializer(data=request.data)
        serailizer.is_valid(raise_exception=True)
        id = serailizer.validated_data['id']
        nova_senha = serailizer.validated_data['nova_senha']
        confirma_senha = serailizer.validated_data['confirma_senha']

        if (nova_senha and confirma_senha) and (nova_senha == confirma_senha):
            try:
                user: CustomUser = CustomUser.objects.get(id=id)
                
                if len(nova_senha) < 8 or not bool(re.search(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+$', nova_senha)):
                    msg = "Nova senha inválida, crie uma senha com 8 ou mais caracteres composta por letras e números!"
                    return Response({"detail": msg}, status=400)
                
                user.set_password(nova_senha)
                user.save()
                
                return Response({"detail": "Senha redefenida com sucesso!"}, status=200)
            except CustomUser.DoesNotExist:
                return Response({"detail": "Usuário não encontrado."}, status=404)
        else:
            return Response({"detail": "Os campos estão vazios ou com valores diferentes!"}, status=400)


        