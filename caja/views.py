import io
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from store.models import Product
from .forms import SellProductForm, InvoiceForm, FilterSoldProductForm
from .models import SoldProduct
from django.http import FileResponse
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter
from reportlab.graphics.barcode import code39
from reportlab.lib.units import inch
from datetime import datetime

@login_required
def index(request):
    return redirect('caja_stock')

@login_required
def stock_view(request):
    products = Product.objects.all()
    query = request.GET.get('q')
    if query:
        products = products.filter(product_name__icontains=query)
    return render(request, 'caja/stock.html', {'products': products})

@login_required
def sold_view(request):
    sold_products = SoldProduct.objects.all().order_by('-sale_date')
    form = FilterSoldProductForm(request.GET or None)
    if form.is_valid():
        start_date = form.cleaned_data.get('start_date')
        end_date = form.cleaned_data.get('end_date')
        if start_date and end_date:
            sold_products = sold_products.filter(sale_date__range=[start_date, end_date])

    return render(request, 'caja/sold.html', {'sold_products': sold_products, 'form': form})

@login_required
def sell_product_view(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    if request.method == 'POST':
        form = InvoiceForm(request.POST)
        if form.is_valid():
            quantity = form.cleaned_data['quantity']
            if product.stock >= quantity:
                product.stock -= quantity
                product.save()
                
                # Registrar la venta
                SoldProduct.objects.create(
                    product=product,
                    customer_name=f"{form.cleaned_data['first_name']} {form.cleaned_data['last_name']}",
                    customer_address=form.cleaned_data['address'],
                    quantity=quantity
                )

                invoice_number = generate_invoice_number()
                pdf = generate_invoice_pdf(form.cleaned_data, product, quantity, invoice_number)
                messages.success(request, f'Se vendieron {quantity} unidades de {product.product_name}.')
                return FileResponse(pdf, as_attachment=True, filename=f'Invoice_{invoice_number}.pdf')
            else:
                messages.error(request, f'No hay suficiente stock para {product.product_name}.')
            return redirect('caja_stock')
    else:
        form = InvoiceForm()
    return render(request, 'caja/sell_product.html', {'form': form, 'product': product})

def generate_invoice_number():
    # Genera un número de factura único
    from random import randint
    return randint(100000, 999999)

def generate_invoice_pdf(form_data, product, quantity, invoice_number):
    buffer = io.BytesIO()
    p = canvas.Canvas(buffer, pagesize=letter)
    p.setLineWidth(.3)
    p.setFont('Helvetica', 12)

    # Información del cliente
    p.drawString(30, 750, f"Nombre: {form_data['first_name']} {form_data['last_name']}")
    p.drawString(30, 735, f"Dirección: {form_data['address']}")

    # Información del producto
    p.drawString(30, 700, f"Producto: {product.product_name}")
    p.drawString(30, 685, f"Precio: ${product.price}")
    p.drawString(30, 670, f"Cantidad: {quantity}")
    p.drawString(30, 655, f"Total: ${product.price * quantity}")

    # Número de factura y código de barras
    p.drawString(500, 750, f"Factura #: {invoice_number}")
    barcode = code39.Extended39(f"{invoice_number}", barHeight=0.5*inch, barWidth=1.5)
    barcode.drawOn(p, 400, 720)

    p.showPage()
    p.save()

    buffer.seek(0)
    return buffer

@login_required
def download_report(request):
    sold_products = SoldProduct.objects.all().order_by('-sale_date')
    form = FilterSoldProductForm(request.GET or None)
    if form.is_valid():
        start_date = form.cleaned_data.get('start_date')
        end_date = form.cleaned_data.get('end_date')
        if start_date and end_date:
            sold_products = sold_products.filter(sale_date__range=[start_date, end_date])

    buffer = io.BytesIO()
    p = canvas.Canvas(buffer, pagesize=letter)
    p.setLineWidth(.3)
    p.setFont('Helvetica', 12)

    p.drawString(30, 800, "Reporte de Productos Vendidos")
    y = 780

    for sold_product in sold_products:
        p.drawString(30, y, f"Producto: {sold_product.product.product_name}, Cantidad: {sold_product.quantity}, Cliente: {sold_product.customer_name}, Fecha: {sold_product.sale_date.strftime('%Y-%m-%d')}")
        y -= 20

    p.showPage()
    p.save()

    buffer.seek(0)
    return FileResponse(buffer, as_attachment=True, filename='sold_products_report.pdf')
import io
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from store.models import Product
from .forms import SellProductForm, InvoiceForm, FilterSoldProductForm
from .models import SoldProduct
from django.http import FileResponse
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter
from reportlab.graphics.barcode import code39
from reportlab.lib.units import inch
from datetime import datetime

@login_required
def index(request):
    return redirect('caja_stock')

@login_required
def stock_view(request):
    products = Product.objects.all()
    query = request.GET.get('q')
    if query:
        products = products.filter(product_name__icontains=query)
    return render(request, 'caja/stock.html', {'products': products})

@login_required
def sold_view(request):
    sold_products = SoldProduct.objects.all().order_by('-sale_date')
    form = FilterSoldProductForm(request.GET or None)
    if form.is_valid():
        start_date = form.cleaned_data.get('start_date')
        end_date = form.cleaned_data.get('end_date')
        if start_date and end_date:
            sold_products = sold_products.filter(sale_date__range=[start_date, end_date])

    return render(request, 'caja/sold.html', {'sold_products': sold_products, 'form': form})

@login_required
def sell_product_view(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    if request.method == 'POST':
        form = InvoiceForm(request.POST)
        if form.is_valid():
            quantity = form.cleaned_data['quantity']
            if product.stock >= quantity:
                product.stock -= quantity
                product.save()
                
                # Registrar la venta
                SoldProduct.objects.create(
                    product=product,
                    customer_name=f"{form.cleaned_data['first_name']} {form.cleaned_data['last_name']}",
                    customer_address=form.cleaned_data['address'],
                    quantity=quantity
                )

                invoice_number = generate_invoice_number()
                pdf = generate_invoice_pdf(form.cleaned_data, product, quantity, invoice_number)
                messages.success(request, f'Se vendieron {quantity} unidades de {product.product_name}.')
                return FileResponse(pdf, as_attachment=True, filename=f'Invoice_{invoice_number}.pdf')
            else:
                messages.error(request, f'No hay suficiente stock para {product.product_name}.')
            return redirect('caja_stock')
    else:
        form = InvoiceForm()
    return render(request, 'caja/sell_product.html', {'form': form, 'product': product})

def generate_invoice_number():
    # Genera un número de factura único
    from random import randint
    return randint(100000, 999999)

def generate_invoice_pdf(form_data, product, quantity, invoice_number):
    buffer = io.BytesIO()
    p = canvas.Canvas(buffer, pagesize=letter)
    p.setLineWidth(.3)
    p.setFont('Helvetica', 12)

    # Información del cliente
    p.drawString(30, 750, f"Nombre: {form_data['first_name']} {form_data['last_name']}")
    p.drawString(30, 735, f"Dirección: {form_data['address']}")

    # Información del producto
    p.drawString(30, 700, f"Producto: {product.product_name}")
    p.drawString(30, 685, f"Precio: ${product.price}")
    p.drawString(30, 670, f"Cantidad: {quantity}")
    p.drawString(30, 655, f"Total: ${product.price * quantity}")

    # Número de factura y código de barras
    p.drawString(500, 750, f"Factura #: {invoice_number}")
    barcode = code39.Extended39(f"{invoice_number}", barHeight=0.5*inch, barWidth=1.5)
    barcode.drawOn(p, 400, 720)

    p.showPage()
    p.save()

    buffer.seek(0)
    return buffer

@login_required
def download_report(request):
    sold_products = SoldProduct.objects.all().order_by('-sale_date')
    form = FilterSoldProductForm(request.GET or None)
    if form.is_valid():
        start_date = form.cleaned_data.get('start_date')
        end_date = form.cleaned_data.get('end_date')
        if start_date and end_date:
            sold_products = sold_products.filter(sale_date__range=[start_date, end_date])

    buffer = io.BytesIO()
    p = canvas.Canvas(buffer, pagesize=letter)
    p.setLineWidth(.3)
    p.setFont('Helvetica', 12)

    p.drawString(30, 800, "Reporte de Productos Vendidos")
    y = 780

    for sold_product in sold_products:
        p.drawString(30, y, f"Producto: {sold_product.product.product_name}, Cantidad: {sold_product.quantity}, Cliente: {sold_product.customer_name}, Fecha: {sold_product.sale_date.strftime('%Y-%m-%d')}")
        y -= 20

    p.showPage()
    p.save()

    buffer.seek(0)
    return FileResponse(buffer, as_attachment=True, filename='sold_products_report.pdf')
