goto
������ �ӵ������� ����� �������ʴ´�

select
update
insert
delete
���� 4���� ���ɾ ������ ������������

declare @int_���� int

set @int_���� = 0

set @int_���� = @int_���� + 1
set @int_���� = @int_���� + 1

goto �̵���ġ1 -- �̵���ġ1�� �̵�

set @int_���� = @int_���� + 1
set @int_���� = @int_���� + 1
set @int_���� = @int_���� + 1

goto �̵���ġ1: -- ����� �̵��ؼ� @int_���� ���

select ��� = @int_����

--------------------------------------------------------------------------------
Ŀ��
-- Ŀ����ž����� �ӽ����̺��� ����ϸ�ȴ�

cursor
���྿�ҷ��� ó�������ش�
�������̰� �ܰ������� ó���Ҷ� ���
���� �����ͺ��̽� ��ü�� ��ȸ�ؼ� ����ϴ°� ������
������ �����;��� ���Ƽ� ����ϱ� ���鶧 cursor�� Ȱ���ϱ⵵�Ѵ�

create table #�۾�(
	�ڵ� nvarchar(10),
	���� numeric(18,0)
)

insert into #�۾� (�ڵ�, ����) values
 ('A1',10),
 ('A2',20),
 ('A3',30)

select * from #�۾�

declare Ŀ��1 cursor for -- Ŀ������
select �ڵ�, ���� from #�۾�
where �ڵ� < 'A3'
order by ���� desc

open Ŀ��1 -- Ŀ��1����

declare @Ŀ��1�ڵ� = nvarchar(10),
		@Ŀ��1_���� = numeric(18,0) -- Ŀ�������͸� ���� ������ ����

while (1 = 1) begin -- ���ѹݺ�

fetch next from Ŀ��1 into @Ŀ��1�ڵ�, @Ŀ��1_���� -- �ѰǾ�(����) �Է�

if @@FETCH_STATUS <> 0 break -- ���� ������ ���ѹݺ��� Ż��
select �ڵ� = @Ŀ��1�ڵ�, ���� = @Ŀ��1_���� -- ������ ���

end

close Ŀ��1 -- Ŀ��1����
deallocate Ŀ��1 -- Ŀ��1����

drop table #�۾�


�ӽ����̺��� ���������


declare @Ŀ��1_�ڵ� nvarchar(10),
		@Ŀ��1_���� numeric(18,0),
		@Ŀ��1_���� int = 1
		@Ŀ��1_�ѰǼ� int = @@rowcount

while (@Ŀ��1_���� <= @Ŀ��1_�ѰǼ�) begin

	select @Ŀ��1_�ڵ� = �ڵ�, @Ŀ��1_���� = ���� from #Ŀ��1
	where ���� = @Ŀ��1_����

	select �ڵ� = @Ŀ��1_�ڵ�, ���� = @Ŀ��1_����

	set @Ŀ��1_���� = @Ŀ��1_���� + 1
end

