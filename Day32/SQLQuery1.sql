use DB4

create table ��ǰ (
	��ǰ nvarchar(30),
	��ǰ�� nvarchar(100),
	primary key (��ǰ)
)

create table ���� (
	���� nvarchar(08),
	��ǰ nvarchar(30),
	���� numeric(18,0) default 0 null,
	primary key (����, ��ǰ)
)

insert into ��ǰ (��ǰ, ��ǰ��) values ('A1', '���'), ('A2', '���')

insert into ���� (����, ��ǰ, ����) values ('20200101', 'A1', 10), ('20200102', 'A2', 20)

select * from ��ǰ
select * from ����

--foreign key (�ܷ�Ű)
--���̺����� ����(����)���� ����Ѵ�

--�⺻����
--alter table [���̺���] add constraint fk�̸� foreign key (���̺� �÷�)
--references [��������̺�] (����� ���̺� �÷���)

alter table ���� add constraint [����_FK1] foreign key ([��ǰ])
	references [��ǰ] (��ǰ)

--���ǻ���
-- 1. �����ϰ��� �ϴ� �÷��� ũ�� ������ ������ �����ؾ��Ѵ�
-- 2. ����Ǵ� ���̺� Į���� �⺻Ű(pk) �Ǵ� unique index �� ���� �Ǿ���Ѵ�

select * from ����

insert into ���� (����, ��ǰ, ����) values ('20200103', 'A3', 30)
-- ���̺��� �浹������ ������ �Ұ����ϴ� (������ �°� �߰��ؾ��Ѵ�)

delete A
from ��ǰ A
where A.��ǰ = 'A1'
and A.��ǰ�� = '���'
-- �ش� ������ ����� �浹�� �Ͼ�� �����̵����ʴ´� 
-- ������ ��ǰ�� ��ǰ���� ������ ��ǰ���� ���� ���谡 �����Ǿ��־ ������ �Ұ��ϴ�

drop table ��ǰ
-- ���谡 �������ִ� ���̺��� ������ �Ұ����ϴ�

drop table ����
-- ���� ������ �����̵Ǵ� �������̺��� ������ �Ѵٸ� �����ϴ�

drop table ��ǰ
-- ������ �����̵Ǵ� �������̺��� �������ȴٸ� ��ǰ ���谡 �̾����ִ� ��ǰ���̺��� ������ �����ϴ�

----------------------------------------------------------------------------------------------

--�ε���(index)

--��ȸ(select), ����(update), ����(delete) �� ���� �� ���̺��� �����ͷ��� ����
--�ӵ� ���Ͻ� å�� ����(ã�ƺ���)�� ������ index�� �����Ͽ� �ӵ��� �����Ҽ��ִ�

--Ʃ�� index �⺻���� �����Ѵ�

--�ε��� ������ �ߺ� ��� ���ο� ���� �Ϲ� index�� unique index�� �з��Ѵ�
--unique index�� �⺻Ű(pk)�� �����ִ� �׷��� �⺻Ű�� ������� ���� ����ũ �ε����� ��������� �ʴ´�

--����
--�ε��� ��������� �߰��� �ʿ��ϴ�
--�Է�, ����, ������ ó���ӵ��� ���ϵȴ�
--(������ �ش� ���̺��� �����ǰų� �Ҷ��� �ε����� �����Ǿ�� �ϱ⶧���� �׷���, ��ȸ�� ���� ����)

--����
--���� ���̺��� index�� �����Ѵ�

-- 1.����_index1 [��ǰ] ����Ű
-- 2.����_index2 [����], [��ǰ] ����Ű

-- 1
create index [����_index1] on [����] ([��ǰ])

-- 2
create unique index [����_index2] on [����] ([����], [��ǰ])

select * from ���� where ��ǰ = 'A2'
--[����_index1]�� �˻����� Ȯ���� ���� (�ε����� �������⶧��)

insert into ���� (����, ��ǰ, ����) values ('20200101', 'A2', 10)

select * from ����

--���� ������Ʈ�߿� ��ȸ�ϸ� ������ ��ȸ���ȴ�
--������Ʈ�� ������ ���� ����ڵ��� ����ϱ� �����ϸ� �����ͺ��̽� ��ȸ�ð��� ��������
--�׷������ ù��° ã�ƺ��°� �ε����̴�

------------------------------------------------------------------

--�ӽ����̺�(temporary table)

--���������� �������� �ʴ´�
--���̺� ��������� #�� ���̴� ���̴�
--create table ���̺���
--������� ���Ǻ��� ������ ���������� ��� ������ �ӽ����̺��̴�
--##�ӽ����̺� : #�ӽ����̺��� ���������� �ٸ� ����ڰ� �����͸� ��ȸ �Ǵ��Է��� �����ϴ�
--               ##�ӽ����̺��� ���ÿ� �ѻ���ڸ� ���� �Ҽ��ִ�
--			   �۷ι��ӽ����̺��̶�� �Ѵ�


--���̺��� Ȱ���� �ڷ� ���� ó���� ������
--- �۾�1 ���̺��� �̿��Ͽ� �ڷ� ���� �� ��� ��ȸ �ϴ� ������ �Ѵٰ� ����

--�����A (���ǹ�ȣ : 100)
--- �̹� ���̺��� �����ϸ� drop table �۾�1
--- create table �۾�1
--- create table �۾�2
--- �ڷᰡ�� �۾�1 (insert, update, delete)
--- �����ȸ �۾�1 (select * from)

--�����B (���ǹ�ȣ : 200)
--- �̹� ���̺��� �����ϸ� drop table �۾�1
--- create table �۾�1
--- create table �۾�2
--- �ڷᰡ�� �۾�1 (insert, update, delete)
--- �����ȸ �۾�1 (select * from)

--���� �����A�� ���̺� �۾��� lock�� �ɸ� �����B�� ����ؾ��Ѵ�
--�׷��� �ӽ����̺��� �̿��ؼ� ������ �ذ��Ҽ��ִ�
