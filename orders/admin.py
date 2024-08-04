from django.contrib import admin
from .models import Payment, Order, OrderProduct

# Registrar tus modelos aquí.

# Clase para mostrar productos de la orden en línea dentro de la vista de la orden
class OrderProductInline(admin.TabularInline):
    model = OrderProduct  # Modelo asociado
    readonly_fields = ('payment', 'user', 'product', 'quantity', 'product_price', 'ordered')  # Campos de solo lectura
    extra = 0  # No mostrar formularios en blanco adicionales

# Clase de configuración para el modelo Order en el admin
class OrderAdmin(admin.ModelAdmin):
    list_display = ['order_number', 'full_name', 'phone', 'email', 'city', 'order_total', 'tax', 'status', 'is_ordered', 'created_at']  # Campos a mostrar en la lista de órdenes
    list_filter = ['status', 'is_ordered']  # Filtros para la lista de órdenes
    search_fields = ['order_number', 'first_name', 'last_name', 'phone', 'email']  # Campos para búsqueda
    list_per_page = 20  # Número de órdenes a mostrar por página
    inlines = [OrderProductInline]  # Incluir los productos de la orden en la vista de la orden

# Registrar los modelos en el sitio de administración
admin.site.register(Payment)  # Registrar el modelo Payment sin configuración adicional
admin.site.register(Order, OrderAdmin)  # Registrar el modelo Order con su configuración
admin.site.register(OrderProduct)  # Registrar el modelo OrderProduct sin configuración adicional
