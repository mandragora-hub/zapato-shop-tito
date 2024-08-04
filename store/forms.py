from django import forms
from .models import ReviewRating, Product

# Formulario para agregar una reseña y calificación del producto
class ReviewForm(forms.ModelForm):
    class Meta:
        model = ReviewRating  # Modelo asociado al formulario
        fields = ['subject', 'review', 'rating']  # Campos del formulario

# Formulario para vender un producto, seleccionando el producto y la cantidad
class SellProductForm(forms.Form):
    product = forms.ModelChoiceField(queryset=Product.objects.all())  # Campo para seleccionar un producto de la lista de todos los productos
    quantity = forms.IntegerField(min_value=1)  # Campo para ingresar la cantidad a vender, con un valor mínimo de 1

# Formulario para vender un producto, solo incluye productos disponibles
class SellProductForm(forms.Form):
    product = forms.ModelChoiceField(queryset=Product.objects.filter(is_available=True))  # Campo para seleccionar un producto de la lista de productos disponibles
    quantity = forms.IntegerField(min_value=1)  # Campo para ingresar la cantidad a vender, con un valor mínimo de 1
