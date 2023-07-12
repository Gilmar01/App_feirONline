
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from rest_framework_simplejwt.views import (
    TokenObtainPairView, TokenRefreshView,    
)

from accounts.views import (
    CreateUserAPI, UserLogadoInfoAPI, MudaSenhaView,
    UserUpdateAPIView, UserDeleteAPIView, ObtemUserPeloEmailWhatsapp,
    RdefineSenhaUser
)
from produtos.views import (
    CreateProdutoAPI, ListaProdutoVendedor,
    ListaProdutos, ProdutoUpdateAPI, ProdutoDeleteAPI
)

urlpatterns = [
    path('admin/', admin.site.urls),
    # Usuário / Vendendor
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('user-create/', CreateUserAPI.as_view(), name="create_user"),
    path('user-info/', UserLogadoInfoAPI.as_view(), name="user_info"),
    path('user-update/', UserUpdateAPIView.as_view(), name="updadte_user"),
    path('user-delete/', UserDeleteAPIView.as_view(), name="delete_user"),
    path("muda-senha/", MudaSenhaView.as_view(), name="muda_senha"),
    path('obtem-user-email/', ObtemUserPeloEmailWhatsapp.as_view(), name='obtem_user_email'),
    path('redefine-senha/', RdefineSenhaUser.as_view(), name="redefine_senha"),

    #Produto
    path("produto-create/", CreateProdutoAPI.as_view(), name="create_produto"),
    path("lista-produto-vendedor/", ListaProdutoVendedor.as_view(), name="lista_produto_vendedor"),
    path("lista-produtos/", ListaProdutos.as_view(), name="lista_produtos"),
    path('produto/<int:pk>/update', ProdutoUpdateAPI.as_view(), name='produto-update'),
    path('produto/<int:pk>/delete/', ProdutoDeleteAPI.as_view(), name='produto-delete'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
