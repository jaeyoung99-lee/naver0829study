--2023-09-21 DB ����ȭ
--DB ����ȭ(Normalization)
--����ȭ��? �Ѹ���� db ������ �޸𸮸� �������� �ʱ� ���ؼ�
--� ���̺��� �ĺ��ڸ� ������ �������� ���̺�� ������ ������ ����ȭ�� �Ѵ�
--����ȭ�� ����Ÿ���̽��� �ߺ��� �ּ�ȭ�ǵ��� ����� ����Ÿ���̽��̴�
--���� : �޸𸮸� �����Ҽ� �ִ�. 
--      ����ȭ�� �ý������� ���ؼ� ������ ���ϴ�
--���� : ��ȸ������ �ſ� ���� �ý����� ��쿡�� ���̺��� join ������ �ݺ�������
--       �̷����� ������ ���� ���� �ӵ��� ��¦ �ʾ����� �ִ�

--student �� num �� �ܺ�Ű�� ���� ���ο� ���̺� stuinfo �� ������
--�ܺ�Ű�� ���̺� �����ÿ� �����ص� �ǰ� ���߿� �����ص��ȴ�

create table stuinfo (
      idx number(5) CONSTRAINT stuinfo_pk_idx primary key,
      num number(5),
      addr varchar2(20),
      hp varchar2(20));

-- student �� num �� �ܺ�Ű�� ����(�̶� ����: student �� num �� �ݵ�� primary key ��� �Ѵ�)
--ppt 29�������� ����
alter table stuinfo add CONSTRAINT stuinfo_fk_num FOREIGN key(num) references student(num);

--stuinfo �� ����Ÿ�� �߰��غ���, ���¹�ȣ�� 9������ insert �� � ������ ������ Ȯ���ʿ�
-- �����޼���: ���Ἲ ��������(ANGEL.STUINFO_FK_NUM)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�
--student ���̺��� �θ����̺�: �ű⿡ num 9 �� ��� ������ ���°�
insert into stuinfo values (seq_stu.nextval,9,'����� ������','010-2323-4545');
--���� �踻���� �����ϰ�� �踻���� num �� 3 �̹Ƿ� 3���� �߰��ؾ߸� �Ѵ�
insert into stuinfo values (seq_stu.nextval,3,'����� ������','010-2323-4545');
      
      
      
      
      
      
      
      
      
      

