Change file permissions chmod
=============================

::

	#chmod g+rwx filename
	#chmod o+r filename
	#chmod 667 filename

	#-- owner -rwx------
	-#- group ----rwx---
	--# other. -------rwx
	
	where g=group, u=owner, o=other

	r=read=4
	w=write=2
	x=execute=1
	a=all=7
	
	+ : add permission
	- : remove permission
	= : set permission
