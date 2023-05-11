#ex 1A
use exercicio_licensas;
select count(idCLIENTE) as qtde_Clientes 
from lcliente;

#ex 1B
select * 
from llicenca 
where month(DtAquisicao) = 11;

#ex 1C
select * 
from llicenca 
where month(DtAquisicao) = 5 and year(DtAquisicao) = 2007;

#ex 1D
select substr(DescricaoTipo, 1, 5), tm.* 
from ltipo_empresa tm 
order by DescricaoTipo asc;

#ex 1E
select substr(DescricaoTipo, -5, 5), tm.* 
from ltipo_empresa tm 
order by DescricaoTipo desc;

#ex 1F
select substr(DescricaoTipo, 6, 10), tm.* 
from ltipo_empresa tm 
order by DescricaoTipo;

#ex 1G
select LENGTH(Nome_RazaoSocial) as bytes_nome, lc.* 
from lcliente lc 
order by Nome_RazaoSocial;

#ex 1H
select NumLicenca, DtAquisicao, datediff(curdate(), DtAquisicao) as dias_de_aquis 
from llicenca ll;

#ex 1I
select upper(NomeSetor), lower(NomeSetor) 
from lsetor;

#ex 1J
select * 
from lversao lv join lsoftware ls on ls.idSOFTWARE=lv.idSOFTWARE_FK 
order by NomeSoftware and Versao;

#ex 1K
select idCLIENTE, Nome_RazaoSocial, DescricaoTipo, NomeSetor 
from lcliente lc 
inner join lsetor lse on lc.idSETOR_FK=lse.idSETOR 
inner join ltipo_empresa le on lc.idTIPO_Empresa_FK=le.idTIPO_Empresa 
order by idTIPO_Empresa and idSETOR;

#ex 1L
select idCLIENTE, Nome_RazaoSocial, idCLIENTE_FK, NumLicenca, DtAquisicao, ValorAquisicao 
from lcliente 
inner join lcliente lc on lc.idCLIENTE=llicenca.idCLIENTE_FK;

#ex 1M
select distinct (lc.Nome_RazaoSocial), ls.NomeSoftware 
from llicenca li
inner join lsoftware ls on li.idSOFTWARE_FK_FK = ls.idSOFTWARE
inner join lcliente lc on li.idCLIENTE_FK = lc.idCLIENTE
order by lc.Nome_RazaoSocial asc;

#ex 1N
select *;
select c.Nome_RazaoSocial, e.DescricaoTipo, s.NomeSetor, c.UF
from lcliente c
inner join ltipo_empresa e on c.idTIPO_Empresa_FK = e.idTIPO_Empresa
inner join lsetor s on c.idSETOR_FK = s.idSETOR
where c.UF in ("SP", "RS", "PR", "MG");

#ex 1O
select s.NomeSoftware Software, v.Versao, c.Nome_RazaoSocial NomeCliente, e.DescricaoTipo TipoCliente,
 se.NomeSetor, l.NumLicenca, l.DtAquisicao, l.ValorAquisicao
from llicenca l
inner join lsoftware s on l.idSOFTWARE_FK_FK = s.idSOFTWARE
inner join lversao v on l.Versao_FK = v.Versao
inner join lcliente c on l.idCLIENTE_FK = c.idCLIENTE
inner join ltipo_empresa e on c.idTIPO_Empresa_FK = e.idTIPO_Empresa
inner join lsetor se on c.idSETOR_FK = se.idSETOR
order by Software, Versao, l.DtAquisicao, NomeCliente;

#ex 1P
select count(*) TotalLicencas from llicenca;

#ex 1Q
select sum(ValorAquisicao) ValorTotal , avg(ValorAquisicao)Media, max(ValorAquisicao)Maior, min(ValorAquisicao) Menor from llicenca;

#ex 1R
select count(Nome_RazaoSocial) from lcliente c
inner join lsetor s on c.idSETOR_FK = s.idSETOR
where s.NomeSetor = "Farmacautica";

#ex 1S
select c.Nome_RazaoSocial, count(l.idSOFTWARE_FK_FK) from llicenca l
inner join lcliente c on l.idCLIENTE_FK = c.idCLIENTE
group by c.Nome_RazaoSocial
order by c.Nome_RazaoSocial asc;

#ex 1T
select c.Nome_RazaoSocial, sum(l.ValorAquisicao) ValorTotal, avg(l.ValorAquisicao) Media
from llicenca l
inner join lcliente c on l.idCLIENTE_FK = c.idCLIENTE
group by c.Nome_RazaoSocial
order by c.Nome_RazaoSocial asc;

#ex 1U
select count(*) TotalLicencas, s.NomeSetor from llicenca l
inner join lcliente c on l.idCLIENTE_FK = c.idCLIENTE
inner join lsetor s on c.idSETOR_FK = s.idSETOR
group by  s.NomeSetor
order by s.NomeSetor;

#ex 1V
select e.DescricaoTipo, count(l.NumLicenca) TotalLicencas  from llicenca l
inner join lcliente c on l.idCLIENTE_FK = c.idCLIENTE
inner join ltipo_empresa e on c.idTIPO_Empresa_FK = e.idTIPO_Empresa
group by e.DescricaoTipo, e.idTIPO_Empresa
order by e.idTIPO_Empresa;

#ex 1W
select s.NomeSoftware, v.Versao, count(l.NumLicenca)
from lsoftware s
inner join lversao v on s.idSOFTWARE = v.idSOFTWARE_FK
inner join llicenca l on l.idSOFTWARE_FK_FK = s.idSOFTWARE
group by s.NomeSoftware, v.Versao
order by s.NomeSoftware, v.Versao;

#ex 1Y
select c.Nome_RazaoSocial, count(l.NumLicenca) Total from lcliente c
inner join llicenca l on c.idCLIENTE = l.idCLIENTE_FK
group by c.Nome_RazaoSocial
having Total > 10;

 
