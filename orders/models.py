from django.db import models
from accounts.models import Account
from store.models import Product, Variation


# Modelo para representar un pago
class Payment(models.Model):
    user = models.ForeignKey(Account, on_delete=models.CASCADE)  # Relación con la cuenta de usuario
    payment_id = models.CharField(max_length=100)  # Identificador del pago
    payment_method = models.CharField(max_length=100)  # Método de pago utilizado
    amount_id = models.CharField(max_length=100)  # Cantidad del pago
    status = models.CharField(max_length=100)  # Estado del pago
    created_at = models.DateTimeField(auto_now_add=True)  # Fecha y hora de creación del pago

    def __str__(self):
        return self.payment_id  # Representación en cadena del objeto Payment


# Modelo para representar una orden
class Order(models.Model):
    STATUS = (  # Posibles estados de una orden
        ('New', 'Nuevo'),
        ('Accepted', 'Aceptado'),
        ('Completed', 'Completado'),
        ('Cancelled', 'Cancelado'),
    )

    user = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True)  # Relación con la cuenta de usuario
    payment = models.ForeignKey(Payment, on_delete=models.SET_NULL, blank=True, null=True)  # Relación con el pago
    order_number = models.CharField(max_length=20)  # Número de la orden
    first_name = models.CharField(max_length=50)  # Nombre del cliente
    last_name = models.CharField(max_length=50)  # Apellido del cliente
    phone = models.CharField(max_length=50)  # Teléfono del cliente
    email = models.CharField(max_length=50)  # Correo electrónico del cliente
    address_line_1 = models.CharField(max_length=100)  # Dirección línea 1
    address_line_2 = models.CharField(max_length=100)  # Dirección línea 2
    country = models.CharField(max_length=50)  # País (agregado)
    city = models.CharField(max_length=50)  # Ciudad (agregado)
    state = models.CharField(max_length=5)  # Estado (código postal en checkout.html)
    order_note = models.CharField(max_length=100, blank=True)  # Nota de la orden
    order_total = models.FloatField()  # Total de la orden
    tax = models.FloatField()  # Impuesto de la orden
    status = models.CharField(max_length=50, choices=STATUS, default='New')  # Estado de la orden
    ip = models.CharField(blank=True, max_length=20)  # Dirección IP del cliente
    is_ordered = models.BooleanField(default=False)  # Indicador de si la orden fue realizada
    created_at = models.DateTimeField(auto_now_add=True)  # Fecha y hora de creación de la orden
    updated_at = models.DateTimeField(auto_now=True)  # Fecha y hora de última actualización de la orden

    def full_name(self):
        return f'{self.first_name} {self.last_name}'  # Método para obtener el nombre completo del cliente

    def full_address(self):
        return f'{self.address_line_1} {self.address_line_2}'  # Método para obtener la dirección completa del cliente

    def __str__(self):
        return self.first_name  # Representación en cadena del objeto Order


# Modelo para representar un producto dentro de una orden
class OrderProduct(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)  # Relación con la orden
    payment = models.ForeignKey(Payment, on_delete=models.CASCADE, blank=True, null=True)  # Relación con el pago
    user = models.ForeignKey(Account, on_delete=models.CASCADE)  # Relación con la cuenta de usuario
    product = models.ForeignKey(Product, on_delete=models.CASCADE)  # Relación con el producto
    variation = models.ManyToManyField(Variation, blank=True)  # Relación con las variaciones del producto
    quantity = models.IntegerField()  # Cantidad del producto
    product_price = models.FloatField()  # Precio del producto
    ordered = models.BooleanField(default=False)  # Indicador de si el producto fue ordenado
    created_at = models.DateTimeField(auto_now_add=True)  # Fecha y hora de creación del OrderProduct
    updated_at = models.DateTimeField(auto_now=True)  # Fecha y hora de última actualización del OrderProduct

    def __str__(self):
        return self.product.product_name  # Representación en cadena del objeto OrderProduct
