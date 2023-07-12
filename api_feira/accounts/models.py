from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.db import models
from django.utils import timezone

from .managers import CustomUserManager

class CustomUser(AbstractBaseUser, PermissionsMixin):

    """ Dados do vendedor """
    nome = models.CharField("Nome", max_length=255, null=True)
    data_nascimento = models.DateField("Data de nascimento", null=True)
    naturalidade = models.CharField("Naturalidade", max_length=255, null=True)
    whatsapp = models.CharField("Whatsapp", max_length=15,null=True)

    """ Dados para autenticação """
    email = models.EmailField(
        "Email", unique=True,
        error_messages={"unique":"Este email já está cadastrada no sistema."},
        help_text="Um email que você use diariamente."
    )
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(default=timezone.now)

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = []

    objects = CustomUserManager()

    def __str__(self):
        return self.email
    
