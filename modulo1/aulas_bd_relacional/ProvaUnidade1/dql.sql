use pos_puc_mod_1_prova_un_1;

select sum(x1.X) * max(x1.y) as r
from T1 x1;

select count(*)
from T1, T2
where T1.x > T2.a;
