from django.db import models
from store.models import Product
from accounts.models import Account

class SoldProduct(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    customer_name = models.CharField(max_length=100)
    customer_address = models.CharField(max_length=255)
    quantity = models.PositiveIntegerField()
    sale_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.quantity} units of {self.product.product_name} sold to {self.customer_name}"
