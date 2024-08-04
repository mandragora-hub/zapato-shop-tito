from django.db import models
from category.models import Category
from django.urls import reverse
from accounts.models import Account
from django.db.models import Avg, Count


# Modelo para representar un producto
class Product(models.Model):
    product_name = models.CharField(max_length=200, unique=True)  # Nombre del producto
    slug = models.CharField(max_length=200, unique=True)  # Slug del producto para URLs
    description = models.TextField(max_length=500, blank=True)  # Descripción del producto
    price = models.IntegerField()  # Precio del producto
    images = models.ImageField(upload_to='photos/products')  # Imágenes del producto
    stock = models.IntegerField()  # Stock disponible del producto
    is_available = models.BooleanField(default=True)  # Disponibilidad del producto
    category = models.ForeignKey(Category, on_delete=models.CASCADE)  # Relación con la categoría del producto
    created_date = models.DateTimeField(auto_now_add=True)  # Fecha y hora de creación del producto
    modified_date = models.DateTimeField(auto_now=True)  # Fecha y hora de última modificación del producto

    def get_url(self):
        return reverse('product_detail', args=[self.category.slug, self.slug])  # URL del detalle del producto

    def __str__(self):
        return self.product_name  # Representación en cadena del objeto Product

    def averageReview(self):
        reviews = ReviewRating.objects.filter(product=self, status=True).aggregate(average=Avg('rating'))  # Calcular la calificación promedio del producto
        avg = 0
        if reviews['average'] is not None:
            avg = float(reviews['average'])
        return avg

    def countReview(self):
        reviews = ReviewRating.objects.filter(product=self, status=True).aggregate(count=Count('id'))  # Contar el número de reseñas del producto
        count = 0
        if reviews['count'] is not None:
            count = int(reviews['count'])
        return count


# Manager para las variaciones del producto
class VariationManager(models.Manager):
    def colors(self):
        return super(VariationManager, self).filter(variation_category='color', is_active=True)  # Obtener variaciones de color activas

    def tallas(self):
        return super(VariationManager, self).filter(variation_category='talla', is_active=True)  # Obtener variaciones de talla activas


variation_category_choice = (
    ('color', 'color'),
    ('talla', 'talla'),
)

# Modelo para representar una variación del producto
class Variation(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)  # Relación con el producto
    variation_category = models.CharField(max_length=100, choices=variation_category_choice)  # Categoría de la variación
    variation_value = models.CharField(max_length=100)  # Valor de la variación
    is_active = models.BooleanField(default=True)  # Indicador de si la variación está activa
    created_date = models.DateTimeField(auto_now=True)  # Fecha y hora de creación de la variación

    objects = VariationManager()  # Manager para el modelo de variación

    def __str__(self):
        return self.variation_category + ' : ' + self.variation_value  # Representación en cadena del objeto Variation


# Modelo para representar una reseña y calificación del producto
class ReviewRating(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)  # Relación con el producto
    user = models.ForeignKey(Account, on_delete=models.CASCADE)  # Relación con el usuario
    subject = models.CharField(max_length=100, blank=True)  # Asunto de la reseña
    review = models.CharField(max_length=500, blank=True)  # Contenido de la reseña
    rating = models.FloatField()  # Calificación del producto
    ip = models.CharField(max_length=20, blank=True)  # Dirección IP del usuario
    status = models.BooleanField(default=True)  # Estado de la reseña (aprobada o no)
    created_at = models.DateTimeField(auto_now_add=True)  # Fecha y hora de creación de la reseña
    updated_at = models.DateTimeField(auto_now=True)  # Fecha y hora de última actualización de la reseña

    def __str__(self):
        return self.subject  # Representación en cadena del objeto ReviewRating


# Modelo para representar la galería de imágenes del producto
class ProductGallery(models.Model):
    product = models.ForeignKey(Product, default=None, on_delete=models.CASCADE)  # Relación con el producto
    image = models.ImageField(upload_to='store/products', max_length=255)  # Imagen de la galería

    def __str__(self):
        return self.product.product_name  # Representación en cadena del objeto ProductGallery
