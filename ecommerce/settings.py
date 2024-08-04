from pathlib import Path
from decouple import config
import os;

# Construir rutas dentro del proyecto, como BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent
SETTINGS_PATH = os.path.dirname(os.path.dirname(__file__))

# Configuración de inicio rápido para el desarrollo - no es adecuada para producción
# Consulte https://docs.djangoproject.com/en/4.2/howto/deployment/checklist/

# ADVERTENCIA DE SEGURIDAD: mantenga la clave secreta utilizada en producción en secreto.
SECRET_KEY = config('SECRET_KEY')

# ADVERTENCIA DE SEGURIDAD: no ejecute con debug activado en producción.
DEBUG = True

ALLOWED_HOSTS = []

# Definición de la aplicación

INSTALLED_APPS = [
    'django.contrib.admin',  # Aplicación de administración de Django
    'django.contrib.auth',  # Aplicación de autenticación de Django
    'django.contrib.contenttypes',  # Aplicación de tipos de contenido de Django
    'django.contrib.sessions',  # Aplicación de sesiones de Django
    'django.contrib.messages',  # Aplicación de mensajes de Django
    'django.contrib.staticfiles',  # Aplicación de archivos estáticos de Django
    'category',  # Aplicación personalizada 'category'
    'accounts',  # Aplicación personalizada 'accounts'
    'store',  # Aplicación personalizada 'store'
    'carts',  # Aplicación personalizada 'carts'
    'orders',  # Aplicación personalizada 'orders'
    'colorfield',  # Aplicación de colorfield
    'admin_interface',  # Aplicación de interfaz de administración
    'caja',  # Aplicación personalizada 'caja'
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',  # Middleware de seguridad de Django
    'django.contrib.sessions.middleware.SessionMiddleware',  # Middleware de sesiones de Django
    'django.middleware.common.CommonMiddleware',  # Middleware común de Django
    'django.middleware.csrf.CsrfViewMiddleware',  # Middleware de protección CSRF de Django
    'django.contrib.auth.middleware.AuthenticationMiddleware',  # Middleware de autenticación de Django
    'django.contrib.messages.middleware.MessageMiddleware',  # Middleware de mensajes de Django
    'django.middleware.clickjacking.XFrameOptionsMiddleware',  # Middleware de protección contra clickjacking de Django
    'django_session_timeout.middleware.SessionTimeoutMiddleware',  # Middleware de tiempo de espera de la sesión
]

# Configuración de tiempo de expiración de la sesión
SESSION_EXPIRE_SECONDS = 1800
SESSION_EXPIRE_AFTER_LAST_ACTIVITY = True
SESSION_TIMEOUT_REDIRECT = 'accounts/login'

ROOT_URLCONF = 'ecommerce.urls'  # Configuración del archivo de URL raíz del proyecto

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',  # Motor de plantillas de Django
        'DIRS': [
            os.path.join(SETTINGS_PATH, 'templates'),
            # BASE_DIR / 'templates'
        ],  # Directorio de plantillas
        'APP_DIRS': True,  # Habilitar la búsqueda de plantillas en los directorios de las aplicaciones
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',  # Procesador de contexto para depuración
                'django.template.context_processors.request',  # Procesador de contexto para la solicitud
                'django.contrib.auth.context_processors.auth',  # Procesador de contexto para la autenticación
                'django.contrib.messages.context_processors.messages',  # Procesador de contexto para mensajes
                'category.context_processors.menu_links',  # Procesador de contexto personalizado para enlaces del menú
                'carts.context_processors.counter',  # Procesador de contexto personalizado para el contador del carrito
            ],
        },
    },
]

WSGI_APPLICATION = 'ecommerce.wsgi.application'  # Configuración de la aplicación WSGI

AUTH_USER_MODEL = 'accounts.Account'  # Modelo de usuario personalizado

# Configuración de la base de datos
# https://docs.djangoproject.com/en/4.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',  # Motor de base de datos
        'NAME': BASE_DIR / 'db.sqlite3',  # Nombre de la base de datos
    }
}

# Validación de contraseñas
# https://docs.djangoproject.com/en/4.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',  # Validador de similitud de atributos del usuario
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',  # Validador de longitud mínima
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',  # Validador de contraseñas comunes
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',  # Validador de contraseñas numéricas
    },
]

# Configuración de internacionalización
# https://docs.djangoproject.com/en/4.2/topics/i18n/

LANGUAGE_CODE = 'en-us'  # Código de idioma
TIME_ZONE = 'UTC'  # Zona horaria
USE_I18N = True  # Habilitar internacionalización
USE_TZ = True  # Habilitar soporte de zonas horarias

# Archivos estáticos (CSS, JavaScript, Imágenes)
# https://docs.djangoproject.com/en/4.2/howto/static-files/

STATIC_URL = 'static/'  # URL para archivos estáticos
STATIC_ROOT = BASE_DIR / 'static'  # Directorio raíz para archivos estáticos
STATICFILES_DIRS = [
    'ecommerce/static'  # Directorios adicionales para archivos estáticos
]

MEDIA_URL = 'media/'  # URL para archivos multimedia
MEDIA_ROOT = BASE_DIR / 'media'  # Directorio raíz para archivos multimedia

from django.contrib.messages import constants as messages  # Importar constantes de mensajes
MESSAGE_TAGS = {
    messages.ERROR: 'danger',  # Personalizar la etiqueta de mensajes de error
}

# Tipo de campo de clave primaria predeterminado
# https://docs.djangoproject.com/en/4.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'  # Tipo de campo de clave primaria predeterminado
COLORFIELD_DEFAULT_COLOR = '#FFFFFF'  # Color predeterminado para ColorField
LOGIN_URL = 'securelogin/login/'  # URL de inicio de sesión
LOGIN_REDIRECT_URL = '/'  # URL de redirección después del inicio de sesión
LOGIN_URL = '/caja/login/'  # URL de inicio de sesión

# Configuración de correo electrónico
# EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
# EMAIL_HOST = 'smtp.gmail.com'
# EMAIL_PORT = 587
# EMAIL_USE_TLS = True
# EMAIL_USE_SSL = False
# EMAIL_HOST_USER = config('EMAIL_HOST_USER')
# EMAIL_HOST_PASSWORD = config('EMAIL_HOST_PASSWORD')
# DEFAULT_FROM_EMAIL = config('DEFAULT_FROM_EMAIL')
