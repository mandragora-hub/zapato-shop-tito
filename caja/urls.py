from django.urls import path
from .views import index, stock_view, sold_view, sell_product_view, download_report

urlpatterns = [
    path('', index, name='caja_index'),
    path('stock/', stock_view, name='caja_stock'),
    path('sold/', sold_view, name='caja_sold'),
    path('sell/<int:product_id>/', sell_product_view, name='sell_product'),
    path('download_report/', download_report, name='download_report'),
]
