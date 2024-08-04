from django.shortcuts import render, get_object_or_404, redirect
from .models import Product, ReviewRating, ProductGallery
from category.models import Category
from carts.models import CartItem
from carts.views import _cart_id
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.db.models import Q
from .forms import ReviewForm
from django.contrib import messages
from orders.models import OrderProduct
from .forms import SellProductForm

# Crear tus vistas aquí.

# Vista para la tienda
def store(request, category_slug=None):
    categories = None
    products = None

    if category_slug is not None:
        categories = get_object_or_404(Category, slug=category_slug)  # Obtener la categoría o devolver 404 si no existe
        products = Product.objects.filter(category=categories, is_available=True).order_by('id')  # Filtrar productos por categoría y disponibilidad
        paginator = Paginator(products, 6)  # Paginación de productos, 6 por página
        page = request.GET.get('page')
        paged_products = paginator.get_page(page)  # Obtener la página solicitada
        product_count = products.count()  # Contar la cantidad de productos
    else:
        products = Product.objects.all().filter(is_available=True).order_by('id')  # Obtener todos los productos disponibles
        paginator = Paginator(products, 6)  # Paginación de productos, 6 por página
        page = request.GET.get('page')
        paged_products = paginator.get_page(page)  # Obtener la página solicitada
        product_count = products.count()  # Contar la cantidad de productos

    context = {
        'products': paged_products,  # Productos paginados
        'product_count': product_count,  # Cantidad de productos
    }

    return render(request, 'store/store.html', context)  # Renderizar la plantilla con el contexto


# Vista para el detalle del producto
def product_detail(request, category_slug, product_slug):
    try:
        single_product = Product.objects.get(category__slug=category_slug, slug=product_slug)  # Obtener el producto por categoría y slug
        in_cart = CartItem.objects.filter(cart__cart_id=_cart_id(request), product=single_product).exists()  # Verificar si el producto está en el carrito
    except Exception as e:
        raise e

    if request.user.is_authenticated:
        try:
            orderproduct = OrderProduct.objects.filter(user=request.user, product__id=single_product.id).exists()  # Verificar si el usuario ha ordenado el producto
        except OrderProduct.DoesNotExist:
            orderproduct = None
    else:
        orderproduct = None

    reviews = ReviewRating.objects.filter(product__id=single_product.id, status=True)  # Obtener las reseñas aprobadas del producto
    product_gallery = ProductGallery.objects.filter(product_id=single_product.id)  # Obtener la galería de imágenes del producto

    context = {
        'single_product': single_product,  # Producto único
        'in_cart': in_cart,  # Si el producto está en el carrito
        'orderproduct': orderproduct,  # Si el producto ha sido ordenado por el usuario
        'reviews': reviews,  # Reseñas del producto
        'product_gallery': product_gallery,  # Galería de imágenes del producto
    }

    return render(request, 'store/product_detail.html', context)  # Renderizar la plantilla con el contexto


# Vista para buscar productos
def search(request):
    if 'keyword' in request.GET:
        keyword = request.GET['keyword']
        if keyword:
            products = Product.objects.order_by('-created_date').filter(Q(description__icontains=keyword) | Q(product_name__icontains=keyword))  # Buscar productos por palabra clave
            product_count = products.count()  # Contar la cantidad de productos encontrados
    context = {
        'products': products,  # Productos encontrados
        'product_count': product_count,  # Cantidad de productos encontrados
    }

    return render(request, 'store/store.html', context)  # Renderizar la plantilla con el contexto


# Vista para enviar una reseña del producto
def submit_review(request, product_id):
    url = request.META.get('HTTP_REFERER')
    if request.method == 'POST':
        try:
            reviews = ReviewRating.objects.get(user__id=request.user.id, product__id=product_id)  # Obtener la reseña existente del usuario para el producto
            form = ReviewForm(request.POST, instance=reviews)  # Instanciar el formulario con la reseña existente
            form.save()
            messages.success(request, 'Muchas gracias!, tu comentario ha sido actualizado.')
            return redirect(url)
        except ReviewRating.DoesNotExist:
            form = ReviewForm(request.POST)
            if form.is_valid():
                data = ReviewRating()
                data.subject = form.cleaned_data['subject']
                data.rating = form.cleaned_data['rating']
                data.review = form.cleaned_data['review']
                data.ip = request.META.get('REMOTE_ADDR')
                data.product_id = product_id
                data.user_id = request.user.id
                data.save()
                messages.success(request, 'Muchas gracias!, tu comentario ha sido publicado.')
                return redirect(url)
            
# Vista para vender un producto
def sell_product(request):
    if request.method == 'POST':
        form = SellProductForm(request.POST)
        if form.is_valid():
            product = form.cleaned_data['product']
            quantity = form.cleaned_data['quantity']

            if product.stock >= quantity:
                product.stock -= quantity
                product.save()
                messages.success(request, f'Se vendieron {quantity} unidades de {product.product_name}.')
            else:
                messages.error(request, f'No hay suficiente stock para {product.product_name}.')
            return redirect('admin:sell_product')
    else:
        form = SellProductForm()

    context = {
        'form': form,  # Formulario de venta de producto
    }
    return render(request, 'admin/sell_product.html', context)  # Renderizar la plantilla con el contexto
