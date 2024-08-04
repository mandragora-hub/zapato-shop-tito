"""
Configuración de URLs para el proyecto ecommerce.

La lista `urlpatterns` enruta URLs a vistas. Para más información, consulte:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Ejemplos:
Vistas basadas en funciones
    1. Agregue una importación:  from my_app import views
    2. Agregue una URL a urlpatterns:  path('', views.home, name='home')
Vistas basadas en clases
    1. Agregue una importación:  from other_app.views import Home
    2. Agregue una URL a urlpatterns:  path('', Home.as_view(), name='home')
Incluyendo otra configuración de URL
    1. Importe la función include(): from django.urls import include, path
    2. Agregue una URL a urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from . import views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('securelogin/', admin.site.urls),  # Ruta para acceder al sitio de administración
    path('', views.home, name="home"),  # Ruta para la página de inicio
    path('store/', include('store.urls')),  # Incluir las URLs de la aplicación 'store'
    path('cart/', include('carts.urls')),  # Incluir las URLs de la aplicación 'carts'
    path('accounts/', include('accounts.urls')),  # Incluir las URLs de la aplicación 'accounts'
    path('accounts/', include('django.contrib.auth.urls')),  # Incluir las URLs de autenticación de Django
    path('orders/', include('orders.urls')),  # Incluir las URLs de la aplicación 'orders'
    path('caja/', include('caja.urls')),  # Incluir las URLs de la aplicación 'caja'
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)  # Agregar rutas para servir archivos estáticos durante el desarrollo
