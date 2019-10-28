
###布局类Widget都会包含一个或多个子widget，不同的布局类Widget对子widget排版(layout)方式不同。我们在前面说过Element树才是最终的绘制树，Element树是通过widget树来创建的（通过Widget.createElement()），widget其实就是Element的配置数据。Flutter中，根据Widget是否需要包含子节点将Widget分为了三类，分别对应三种Element


Widget	                        对应的Element	                        用途
LeafRenderObjectWidget	        LeafRenderObjectElement	Widget树的叶子节点，用于没有子节点的widget，通常基础widget都属于这一类，如Text、Image。
SingleChildRenderObjectWidget	SingleChildRenderObjectElement	        包含一个子Widget，如：ConstrainedBox、DecoratedBox等
MultiChildRenderObjectWidget	MultiChildRenderObjectElement	        包含多个子Widget，一般都有一个children参数，接受一个Widget数组。如Row、Column、Stack等