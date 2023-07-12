from rest_framework import serializers

from accounts.accounts_serializers import UserInfoSerializer
from accounts.models import CustomUser

from .models import Produto


class ProdutoSerializer(serializers.ModelSerializer):

    id = serializers.IntegerField(read_only=True)
    
    class Meta:
        model = Produto
        fields = ["id", "nome", "descricao", "preco", "quantidade", "imagem","vendedor"]


class ProdutoUpdateSerializer(serializers.ModelSerializer):

    id = serializers.IntegerField(read_only=True)
    
    class Meta:
        model = Produto
        fields = ["id", "nome", "descricao", "preco", "quantidade", "imagem"]


class ListaProdutosParaClienteSerializer(serializers.ModelSerializer):

    id = serializers.IntegerField(read_only=True)
    vendedor = UserInfoSerializer()

    class Meta:
        model = Produto
        fields = ["id", "nome", "descricao", "preco", 'quantidade', 'imagem', 'vendedor']