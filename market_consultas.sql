-- 1. Top clientes con más facturas
select count(*) as cantidad_facturas, c.nombre, c.apellido , c.nro_cedula
from factura f inner join cliente c on f.cliente_id = c.id
group by c.nombre, c.apellido , c.nro_cedula
order by cantidad_facturas desc;


-- 2. Top clientes que más gastaron
select SUM(p. precio * fd.cantidad) as gasto , c.nombre, c.apellido, c.nro_cedula
from factura f 
inner join factura_detalle fd on fd.factura_id = f.id
inner join producto p on fd.producto_id = p.id
inner join cliente c on f.cliente_id = c.id
group by c.nombre, c.apellido, c.nro_cedula
order by gasto desc;

-- 3. Top monedas más utilizadas
select m.nombre, count(*) as cantidad_utilizadas 
from factura as f inner join moneda as m on f.moneda_id=m.id 
group by  m.id
order by cantidad_utilizadas desc;


-- 4. Top proveedor de productos
select count(*) as cantidad_productos, pr.nombren as producto
from producto p inner join proveedor pr on p.proveedor_id = pr.id
group by pr.nombre
order by cantidad_productos desc

-- 5. Productos más vendidos
select sum(fd.cantidad) as cantidad_vendido, p.nombre as proveedor
from factura_detalle fd inner join producto p on fd.producto_id = p.id
group by p.nombre
order by cantidad_vendido desc

-- Productos menos vendidos
select sum(fd.cantidad) as cantidad_vendido, p.nombre as producto
from factura_detalle fd inner join producto p on fd.producto_id = p.id
group by p.nombre
order by cantidad_vendido asc

-- Consulta que muestre fecha de emisión de factura, 
-- nombre y apellido del cliente, nombres de productos de esa factura, 
-- cantidades compradas, nombre de tipo de factura de una factura específica

select fd.factura_id, f.fecha_emision, c.nombre, c.apellido, p.nombre as productos, fd.cantidad, ft.nombre as tipo_factura
from factura f  inner join factura_detalle fd on fd.factura_id = f.id
inner join cliente c on f.cliente_id = c.id
inner join producto p on fd.producto_id = p.id
inner join factura_tipo ft  on f.factura_tipo_id = ft.id
where f.id = 5


-- Montos de facturas ordenadas según totales
select f.id, SUM(p. precio * fd.cantidad) as total
from factura f 
inner join factura_detalle fd on fd.factura_id = f.id
inner join producto p on fd.producto_id = p.id
group by f.id
order by total desc;

-- Mostrar el iva 10% de los montos totales de facturas (suponer que todos los productos tienen IVA 10%)
select f.id, SUM(p. precio * fd.cantidad) as total, SUM(p. precio * fd.cantidad *0.10) as iva
from factura f 
inner join factura_detalle fd on fd.factura_id = f.id
inner join producto p on fd.producto_id = p.id
group by f.id
order by total desc;

