from graphviz import Digraph

dot = Digraph(comment='Backtracking Magic Square')
dot.attr(rankdir='TB', splines='ortho')

dot.node('R', label='<<TABLE BORDER="0" CELLBORDER="1">\
<TR><TD>0</TD><TD>0</TD><TD>0</TD></TR>\
<TR><TD>0</TD><TD>0</TD><TD>0</TD></TR>\
<TR><TD>0</TD><TD>0</TD><TD>0</TD></TR></TABLE>>', shape='none')

for k in range(1, 10):
    node_id = f'L1_{k}'
    label = f'<<TABLE BORDER="0" CELLBORDER="1">\
    <TR><TD BGCOLOR="#FFCCCC">{k}</TD><TD>0</TD><TD>0</TD></TR>\
    <TR><TD>0</TD><TD>0</TD><TD>0</TD></TR>\
    <TR><TD>0</TD><TD>0</TD><TD>0</TD></TR></TABLE>>'
    dot.node(node_id, label=label, shape='none')
    dot.edge('R', node_id)
    
    for m in range(1, 10):
        if m != k:
            node_id2 = f'L2_{k}_{m}'
            label2 = f'<<TABLE BORDER="0" CELLBORDER="1">\
            <TR><TD BGCOLOR="#FFCCCC">{k}</TD><TD BGCOLOR="#CCFFCC">{m}</TD><TD>0</TD></TR>\
            <TR><TD>0</TD><TD>0</TD><TD>0</TD></TR>\
            <TR><TD>0</TD><TD>0</TD><TD>0</TD></TR></TABLE>>'
            dot.node(node_id2, label=label2, shape='none')
            dot.edge(node_id, node_id2)

dot.render('2b-bt-arbol', view=True, format='jpg')