from django.contrib import admin
from .models import Product, Variation, ReviewRating, ProductGallery
import admin_thumbnails

# Decorador para mostrar miniaturas de imágenes en el admin
@admin_thumbnails.thumbnail('image')
class ProductGalleryInLine(admin.TabularInline):
    model = ProductGallery  # Modelo asociado
    extra = 1  # Número de formularios en blanco adicionales

# Clase de configuración para el modelo Product en el admin
class ProductAdmin(admin.ModelAdmin):
    list_display = ('product_name', 'price', 'stock', 'category', 'modified_date', 'is_available')  # Campos a mostrar en la lista de productos
    prepopulated_fields = {'slug': ('product_name',)}  # Campos que se autocompletan
    inlines = [ProductGalleryInLine]  # Incluir la galería de productos en la vista del producto

# Clase de configuración para el modelo Variation en el admin
class VariationAdmin(admin.ModelAdmin):
    list_display = ('product', 'variation_category', 'variation_value', 'is_active')  # Campos a mostrar en la lista de variaciones
    list_editable = ('is_active',)  # Campos que se pueden editar directamente en la lista
    list_filter = ('product', 'variation_category', 'variation_value', 'is_active')  # Filtros para la lista de variaciones

# Registrar los modelos en el sitio de administración
admin.site.register(Product, ProductAdmin)  # Registrar el modelo Product con su configuración
admin.site.register(Variation, VariationAdmin)  # Registrar el modelo Variation con su configuración
admin.site.register(ReviewRating)  # Registrar el modelo ReviewRating sin configuración adicional
admin.site.register(ProductGallery)  # Registrar el modelo ProductGallery sin configuración adicional
