F8::

x = %CLIPBOARD%

if (GrantedCapacity := VarSetCapacity(x, -1) > 15)
	ToolTip, Check Title : %CLIPBOARD% %GrantedCapacity%, 0, 0
else	
	ToolTip, Check Title : Hello %CLIPBOARD% %GrantedCapacity%, 0, 0