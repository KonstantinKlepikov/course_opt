# ���������� ���������� ������ � ������ ��������
set REACTORS; # ��������� ���������

param cost_proc {REACTORS}; #������������ ��� ������ �� �����������
param a {REACTORS}; # ���������� ������� ��� ������ �� �����������
param cost_rm; #��������� �����

param conversion {REACTORS}; #������� ����������� � ��������

param x_start {REACTORS}; # ��������� �����������

param yield; # ��������� ������������������ �� ��������

var x {r in REACTORS} >=1e-10 := x_start[r]; # ������ ������� ���������
# ��� ������ ������� �� ���������, �.�. ���������� ������� ����������� � ����
# x_start - ��������� �����������

# ������� ������� - ������� ���������� ������ (����� + �����������)
minimize TotalCost:
	sum {r in REACTORS} cost_proc[r] * x[r]^a[r] 
			+ cost_rm * sum {r in REACTORS} x[r];

subject to Yield:
	sum {r in REACTORS} conversion[r] * x[r] = yield;
	

data;

param :	REACTORS :	cost_proc	a	conversion	x_start :=
		r1			5.5			0.6	0.8			1
		r2			4.0			0.6	0.667		1;
		
param yield := 10;
param cost_rm := 5;

end;


 			

