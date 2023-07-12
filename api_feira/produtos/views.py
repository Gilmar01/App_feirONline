from rest_framework import generics
from rest_framework.permissions import IsAuthenticated
from .produto_serializers import (
    ProdutoSerializer, ListaProdutosParaClienteSerializer,
    ProdutoUpdateSerializer
)
from .models import Produto


class CreateProdutoAPI(generics.CreateAPIView):
    """ Endpoint para um vendendor cadastrar um produto """
    permission_classes = [IsAuthenticated]
    queryset = Produto.objects.all().order_by("-id")
    serializer_class = ProdutoSerializer


class ListaProdutoVendedor(generics.ListAPIView):
    """ Endpoint lista somente os produtos do vendedor logado """
    permission_classes = [IsAuthenticated]
    serializer_class = ProdutoSerializer

    def get_queryset(self):
        user = self.request.user
        return Produto.objects.filter(vendedor=user)

class ListaProdutos(generics.ListAPIView):
    """ Endpoint lista todos os produtos a venda no sistema """
    queryset = Produto.objects.all().order_by("-id")
    serializer_class = ListaProdutosParaClienteSerializer

class ProdutoUpdateAPI(generics.UpdateAPIView):
    """ Endpoint para alterar um produto """
    permission_classes = [IsAuthenticated]
    queryset = Produto.objects.all()
    serializer_class = ProdutoUpdateSerializer

class ProdutoDeleteAPI(generics.DestroyAPIView):
    """ Endpoint para excluir um produto """
    permission_classes = [IsAuthenticated]
    queryset = Produto.objects.all()
    serializer_class = ProdutoSerializer