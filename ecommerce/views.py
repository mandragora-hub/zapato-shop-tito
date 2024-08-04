from django.shortcuts import render
from store.models import Product, ReviewRating

# Vista para la página de inicio
def home(request):
    # Obtener todos los productos disponibles y ordenarlos por fecha de creación
    products = Product.objects.all().filter(is_available=True).order_by('created_date')

    # Para cada producto, obtener las reseñas que están aprobadas
    for product in products:
        reviews = ReviewRating.objects.filter(product_id=product.id, status=True)

    # Crear el contexto para pasar a la plantilla
    context = {
        'products': products,  # Lista de productos disponibles
        'reviews': reviews,    # Reseñas de los productos
    }

    # Renderizar la plantilla 'home.html' con el contexto
    return render(request, 'home.html', context)
