import gtk

w = gtk.Window()
w.resize(300, 300)

cols = [(1,8,3),
        (7,12,9),
        (4,5,6),
        (10,11,12)]

model = gtk.ListStore(int, int, int)
model.set_sort_column_id(0, gtk.SORT_ASCENDING)
model.set_default_sort_func(None )

#sort columns in ascending order for the column 0
cols.sort(lambda x,y: cmp(x[0],y[0]), reverse=True)

for c in cols:
    model.append(c)

tv = gtk.TreeView(model)
tv.set_headers_clickable(True)

columns = ('one', 'two', 'three')
renderer = gtk.CellRendererText()
for i, c in enumerate(columns):
    col = gtk.TreeViewColumn(c, renderer)
    col.add_attribute(renderer, 'text', i)
    col.set_clickable(True)
    col.set_sort_column_id(0)
    col.set_sort_indicator(True)
    tv.append_column(col)

w.add(tv)
w.show_all()
w.connect('destroy', lambda _: gtk.main_quit())
gtk.main()
