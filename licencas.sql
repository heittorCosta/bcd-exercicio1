#ex 1A
use exercicio_licensas;
select count(idCLIENTE) as qtde_Clientes from lcliente;

#ex 1B
select * from llicenca where month(DtAquisicao) = 11;

#ex 1C
select * from llicenca where month(DtAquisicao) = 5 and year(DtAquisicao) = 2007;

#ex 1D
select idTipo_Empresa, DescricaoTipo, substr(DescricaoTipo, 1, 5) '5 Primeira Letras'
from ltipo_empresa tm 
order by DescricaoTipo asc;

#ex 1E
select idTipo_Empresa, DescricaoTipo, substr(DescricaoTipo, -5) '5 Ultimas Letras'
from ltipo_empresa tm 
order by DescricaoTipo desc;

#ex 1F
select idTipo_Empresa, DescricaoTipo, substr(DescricaoTipo, 6, 5) as 'Da posição 6 até a 10' 
from ltipo_empresa tm order by DescricaoTipo;

#ex 1G
select Nome_RazaoSocial, LENGTH(Nome_RazaoSocial) as bytes_nome from lcliente 
order by Nome_RazaoSocial;

#ex 1H
select NumLicenca, DtAquisicao, datediff(now(), DtAquisicao) as dias_de_aquis from llicenca;

#ex 1I
select upper(NomeSetor), lower(NomeSetor) from lsetor;

#ex 1J
select * from lversao lv inner join lsoftware ls on ls.idSOFTWARE=lv.idSOFTWARE_FK order by NomeSoftware and Versao;

#ex 1K
select idCLIENTE, Nome_RazaoSocial, DescricaoTipo, NomeSetor 
from lcliente lc 
inner join lsetor lse on lc.idSETOR_FK=lse.idSETOR 
inner join ltipo_empresa le on lc.idTIPO_Empresa_FK=le.idTIPO_Empresa 
order by idTIPO_Empresa and idSETOR;

#ex 1L
select idCLIENTE, Nome_RazaoSocial as Nome, NumLicenca as Licenca, DtAquisicao, ValorAquisicao 
from lcliente c 
inner join llicenca lc on lc.idCLIENTE_FK = c.idCLIENTE;

#ex 1M
select distinct (lc.Nome_RazaoSocial), ls.NomeSoftware from llicenca li
join lsoftware ls on li.idSOFTWARE_FK_FK = ls.idSOFTWARE
join lcliente lc on li.idCLIENTE_FK = lc.idCLIENTE
order by lc.Nome_RazaoSocial, ls.NomeSoftware asc;

#ex 1N
select c.Nome_RazaoSocial, e.DescricaoTipo, s.NomeSetor, c.UF
from lcliente c
join ltipo_empresa e on c.idTIPO_Empresa_FK = e.idTIPO_Empresa
join lsetor s on c.idSETOR_FK = s.idSETOR
where c.UF in ("SP", "RS", "PR", "MG");

#ex 1O
select s.NomeSoftware Software, v.Versao, c.Nome_RazaoSocial NomeCliente, e.DescricaoTipo TipoCliente,
 se.NomeSetor, l.NumLicenca, l.DtAquisicao, l.ValorAquisicao
from llicenca l
join lsoftware s on l.idSOFTWARE_FK_FK = s.idSOFTWARE
join lversao v on l.Versao_FK = v.Versao
join lcliente c on l.idCLIENTE_FK = c.idCLIENTE
join ltipo_empresa e on c.idTIPO_Empresa_FK = e.idTIPO_Empresa
join lsetor se on c.idSETOR_FK = se.idSETOR
order by Software, Versao, l.DtAquisicao, NomeCliente;

#ex 1P
select count(*) TotalLicencas from llicenca;

#ex 1Q
select sum(ValorAquisicao) ValorTotal , avg(ValorAquisicao)Media, max(ValorAquisicao)Maior, min(ValorAquisicao) Menor from llicenca;

#ex 1R
select count(Nome_RazaoSocial) from lcliente c
join lsetor s on c.idSETOR_FK = s.idSETOR
where s.NomeSetor = "Farmacautica";

#ex 1S
select c.Nome_RazaoSocial, count(l.idSOFTWARE_FK_FK) from llicenca l
inner join lcliente c on l.idCLIENTE_FK = c.idCLIENTE
group by c.idCLIENTE
order by c.Nome_RazaoSocial asc;

#ex 1T
select c.Nome_RazaoSocial, sum(l.ValorAquisicao) ValorTotal, avg(l.ValorAquisicao) Media
from llicenca l
inner join lcliente c on l.idCLIENTE_FK = c.idCLIENTE
group by c.idCLIENTE
order by c.Nome_RazaoSocial asc;

#ex 1U
select count(*) TotalLicencas, s.NomeSetor from llicenca l
join lcliente c on l.idCLIENTE_FK = c.idCLIENTE
join lsetor s on c.idSETOR_FK = s.idSETOR
group by  s.idSETOR
order by s.NomeSetor asc;

#ex 1V
select e.DescricaoTipo, count(l.NumLicenca) TotalLicencas  from llicenca l
join lcliente c on l.idCLIENTE_FK = c.idCLIENTE
join ltipo_empresa e on c.idTIPO_Empresa_FK = e.idTIPO_Empresa
group by e.DescricaoTipo, e.idTIPO_Empresa
order by e.idTIPO_Empresa;

#ex 1W
select s.NomeSoftware, v.Versao, count(l.NumLicenca)
from lsoftware s
inner join lversao v on s.idSOFTWARE = v.idSOFTWARE_FK
inner join llicenca l on l.idSOFTWARE_FK_FK = s.idSOFTWARE
group by s.NomeSoftware, v.Versao
order by s.NomeSoftware, v.Versao;

#ex 1X
select s.NomeSoftware, c.Nome_RazaoSocial as nomeEmpresa,
count(l.NumLicenca) as 'total licencas'
from llicenca l
join lcliente c on l.idCLIENTE_FK = c.idCLIENTE
join lsoftware s on l.idSOFTWARE_FK_FK = s.idSOFTWARE
group by c.Nome_RazaoSocial, s.idSOFTWARE
order by c.Nome_RazaoSocial asc;

#ex 1Y
select c.Nome_RazaoSocial, count(l.NumLicenca) Total from lcliente c
inner join llicenca l on c.idCLIENTE = l.idCLIENTE_FK
group by c.Nome_RazaoSocial
having Total > 10;