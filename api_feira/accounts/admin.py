from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

# Register your models here.
from .models import CustomUser

class UserAdminConfig(UserAdmin):
    
    model = CustomUser
    list_display = ( 'email','is_superuser','is_staff', 'is_active',)
    list_filter = ( 'email', 'is_superuser','is_staff', 'is_active',)
    fieldsets = (
        (None, {'fields': ('nome', 'data_nascimento', 'naturalidade', 'whatsapp', 'email', 'password')}),
        ('Permissions', {'fields': ('is_superuser','is_staff', 'is_active')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('nome', 'data_nascimento', 'naturalidade', 'whatsapp', 'email', 'password1', 'password2', 'is_superuser','is_staff', 'is_active')}
        ),
    )
    search_fields = ('email',)
    ordering = ('email',)

admin.site.register(CustomUser, UserAdminConfig)