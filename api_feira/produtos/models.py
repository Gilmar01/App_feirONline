import os
from django.db import models
from django.conf import settings
# Create your models here.


class Produto(models.Model):

    nome = models.CharField("Nome", max_length=255)
    descricao = models.TextField("Descrição")
    preco = models.DecimalField(
        "Preço",max_digits=12, decimal_places=2,
        help_text="Preço de venda do produto"
    )
    quantidade = models.IntegerField("Quantidade", default=0)
    imagem = models.ImageField(upload_to='images/')
    
    vendedor = models.ForeignKey(#User será um vendedor aqui.
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE, 
        verbose_name='Vendedor'
    )

    def __str__(self) -> str:
        return self.nome
    
    def save(self, *args, **kwargs):
        # Verifica se o produto já existe no banco de dados
        if self.pk is not None:
            # Obtém o produto existente no banco de dados
            produto_antigo = Produto.objects.get(pk=self.pk)
            # Compara se a imagem foi alterada
            if produto_antigo.imagem and produto_antigo.imagem != self.imagem:
                # Remove a imagem antiga
                path_antigo = produto_antigo.imagem.path
                if os.path.exists(path_antigo):
                    os.remove(path_antigo)

        super().save(*args, **kwargs)
    
    def delete(self, *args, **kwargs):
        """ Exclui a imagem associada ao produto """
        if self.imagem:
            path = self.imagem.path
            if os.path.exists(path):
                os.remove(path)

        super().delete(*args, **kwargs)

    

