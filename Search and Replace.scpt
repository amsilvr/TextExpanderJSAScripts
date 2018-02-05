JsOsaDAS1.001.00bplist00�Vscripto� / /   S e a r c h   a n d   R e p l a c e . 
 / / 
 / /   S e a r c h   a n d   r e p l a c e   p l a i n   t e x t   c o n t e n t   i n   u s e r - s e l e c t e d   s e t   o f   g r o u p s . 
 / / 
 / /   C o p y r i g h t   2 0 1 8   S m i l e O n M y M a c ,   L L C .   S e e   L I C E N S E . m d   f o r   l i c e n s e   t e r m s . 
 
 / /   P r e l i m i n a r i e s 
 T e x t E x p a n d e r   =   A p p l i c a t i o n ( ' T e x t E x p a n d e r ' ) ; 
 F i n d e r   =   A p p l i c a t i o n ( ' F i n d e r ' ) ; 
 c u r r e n t A p p   =   A p p l i c a t i o n . c u r r e n t A p p l i c a t i o n ( ) ; 
 c u r r e n t A p p . i n c l u d e S t a n d a r d A d d i t i o n s   =   t r u e ; 
 
 / /   G e t   s o r t e d   l i s t   o f   g r o u p   n a m e s 
 g r o u p N a m e s   =   T e x t E x p a n d e r . g r o u p s . n a m e ( ) . s o r t ( ) ; 
 
 / /   L e t   u s e r   p i c k   g r o u p ( s )   t o   p r o c e s s 
 l i s t R e s u l t   =   c u r r e n t A p p . c h o o s e F r o m L i s t ( g r o u p N a m e s ,   { w i t h T i t l e : ' G r o u p s ' ,   w i t h P r o m p t : ' P l e a s e   p i c k   g r o u p ( s )   t o   s e a r c h . ' ,   m u l t i p l e S e l e c t i o n s A l l o w e d : t r u e ,   e m p t y S e l e c t i o n A l l o w e d : f a l s e } ) ; 
 
 / /   P r o m p t   f o r   s e a r c h   t e r m 
 s e a r c h T e r m D i a l o g   =   c u r r e n t A p p . d i s p l a y D i a l o g ( " E n t e r   s e a r c h   t e r m : " ,   { w i t h T i t l e :   " S e a r c h " ,   d e f a u l t A n s w e r : " " } ) ; 
 s e a r c h T e r m   =   s e a r c h T e r m D i a l o g . t e x t R e t u r n e d ; 
 
 / /   P r o m p t   f o r   r e p l a c e   t e r m 
 r e p l a c e T e r m   =   u n d e f i n e d ; 
 i f   ( s e a r c h T e r m   ! = =   u n d e f i n e d )   { 
 	 r e p l a c e T e r m D i a l o g   =   c u r r e n t A p p . d i s p l a y D i a l o g ( " E n t e r   r e p l a c e m e n t : " ,   { w i t h T i t l e :   " R e p l a c e " ,   d e f a u l t A n s w e r : " " } ) ; 
 	 r e p l a c e T e r m   =   r e p l a c e T e r m D i a l o g . t e x t R e t u r n e d ; 
 } 
 
 / /   S e a r c h   a n d   r e p l a c e 
 i f   ( r e p l a c e T e r m   ! = =   u n d e f i n e d )   { 
 	 c o n s o l e . l o g ( ` R e p l a c e   $ { s e a r c h T e r m }   w i t h   $ { r e p l a c e T e r m } ` ) ; 
 	 l i s t R e s u l t . f o r E a c h ( f u n c t i o n ( g r o u p N a m e )   { 
 	 	 c o n s t   a G r o u p   =   T e x t E x p a n d e r . g r o u p s . w h o s e ( { n a m e : { _ e q u a l s : g r o u p N a m e } } ) [ 0 ] ; 
 	 	 a G r o u p . s n i p p e t s ( ) . f o r E a c h ( f u n c t i o n ( a S n i p p e t )   { 
 	 	 	 / /   H a n d l e   s e a r c h   a n d   r e p l a c e   f o r   p l a i n   t e x t   s n i p p e t s 
 	 	 	 i f   ( a S n i p p e t . c o n t e n t T y p e ( )   = = =   ' p l a i n _ t e x t ' )   { 
 	 	 	 	 o r i g i n a l C o n t e n t   =   a S n i p p e t . p l a i n T e x t E x p a n s i o n ( ) ; 
 	 	 	 	 n e w C o n t e n t   =   r e p l a c e A l l ( o r i g i n a l C o n t e n t ,   s e a r c h T e r m ,   r e p l a c e T e r m ) ; 
 	 	 	 	 i f   ( n e w C o n t e n t   & &   o r i g i n a l C o n t e n t   ! = =   n e w C o n t e n t )   { 
 	 	 	 	 	 c o n s o l e . l o g ( ` R e p l a c e \ n $ { o r i g i n a l C o n t e n t } \ n & w i t h & \ n $ { n e w C o n t e n t } ` ) ; 	 	 	 	 	 
 	 	 	 	 	 a S n i p p e t . p l a i n T e x t E x p a n s i o n   =   n e w C o n t e n t ; 
 	 	 	 	 } 
 	 	 	 } 
 	 	 	 i f   ( a S n i p p e t . c o n t e n t T y p e ( )   = = =   ' h t m l _ t e x t ' )   { 
 	 	 	 	 c o n s o l e . l o g ( ` S n i p p e t   f o r   a b b r e v i a t i o n   [ $ { a S n i p p e t . a b b r e v i a t i o n ( ) } ]   i s   r i c h   t e x t ,   s o   w e   a r e n ' t   d o i n g   a n y   r e p l a c i n g ,   a s   w e   n e e d   t o   d o   t h a t   b y   t r a v e r s i n g   t h e   D O M . ` ) ; 
 	 	 	 } 	 	 	 
 	 	 } ) ; 
 	 } ) ; 
 } 
 
 / /   U t i l i t y   f u n c t i o n s 
 f u n c t i o n   e s c a p e R e g E x p ( s t r )   { 
         r e t u r n   s t r . r e p l a c e ( / ( [ . * + ? ^ = ! : $ { } ( ) | \ [ \ ] \ / \ \ ] ) / g ,   " \ \ $ 1 " ) ; 
 } 
 
 f u n c t i o n   r e p l a c e A l l ( s t r ,   f i n d ,   r e p l a c e )   { 
         r e t u r n   s t r . r e p l a c e ( n e w   R e g E x p ( e s c a p e R e g E x p ( f i n d ) ,   ' g ' ) ,   r e p l a c e ) ; 
 } 
                              �jscr  ��ޭ