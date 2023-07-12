import re
from rest_framework import serializers

from .models import CustomUser


class UserSerializer(serializers.ModelSerializer):

    id = serializers.IntegerField(read_only=True)
    password = serializers.CharField(write_only=True)
    
    class Meta:
        model = CustomUser
        fields = ["id", "nome", "data_nascimento", "naturalidade", "whatsapp", "email", "password"]
    
    def create(self, validated_data):
        password = validated_data.pop('password')
        user = CustomUser(**validated_data)
        user.set_password(password)
        user.save()
        return user


class UserSerializerUpdateDelete(serializers.ModelSerializer):

    id = serializers.IntegerField(read_only=True)
    
    class Meta:
        model = CustomUser
        fields = ["id", "nome", "data_nascimento", "naturalidade", "whatsapp", "email"]


class UserInfoSerializer(serializers.ModelSerializer):
    """ Para usar na listagem de produtos, para o cliente ver """    
    class Meta:
        model = CustomUser
        fields = ["nome", "whatsapp", "email"]


class MudaSenhaSerializer(serializers.ModelSerializer):
    
    password = serializers.CharField(write_only=True, required=True)
    password2 = serializers.CharField(write_only=True, required=True)
    old_password = serializers.CharField(write_only=True, required=True)

    class Meta:
        model = CustomUser
        fields = ('old_password', 'password', 'password2')

    def validate(self, attrs):
        if attrs['password'] != attrs['password2']:
            raise serializers.ValidationError({"password": "Os campos de senha não correspondem."})
        
        if len(attrs['password']) < 8 or not bool(re.search(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+$', attrs['password'])):
            msg = "Nova senha inválida, crie uma senha com 8 ou mais caracteres composta por letras e números!"
            raise serializers.ValidationError({"password": msg})

        return attrs

    def validate_old_password(self, value):
        user: CustomUser = self.context['request'].user
        if not user.check_password(value):
            raise serializers.ValidationError({"old_password": "A senha antiga não está correta."})
        return value

    def update(self, instance: CustomUser, validated_data):

        instance.set_password(validated_data['password'])
        instance.save()

        return instance


class BuscaUserEmailWhatsappSerializer(serializers.Serializer):
    
    email = serializers.EmailField()
    whatsapp = serializers.CharField()


class RedefineSenhaSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    nova_senha = serializers.CharField()
    confirma_senha = serializers.CharField()

    