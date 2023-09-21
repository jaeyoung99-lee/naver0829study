--PL-SQL�̶�?
-- SQL �� ������ ����Ҹ� �߰��ؼ� ���α׷����Ѱ��� PL-SQL �̶�� �Ѵ�
--���� 1
DECLARE
    -- ���� �����ϴ� ����
    v_no number(4,1); --4�ڸ��� �Ҽ������� 1�ڸ� ���� �ִ� ���� ����
BEGIN
   -- sql�����̳� pl-sql ������ �ڵ��ϴ� ����(:=:����, =:��,����)
   v_no:=12.7;
   DBMS_Output.put_line(v_no);--���
end;
/

--���� 2
DECLARE
   vname varchar2(20);
   vban varchar2(20);
BEGIN
   select
      name,ban
      into vname,vban
    from student where num=6;
   DBMS_Output.put_line(vname||'���� '||vban||'�Դϴ�');
end;
/

--person�� food ���̺��� �����Ͽ� person_num �� 9 �λ���� �̸�,�ֹ��� �޴�,������ ����Ͻÿ�
--���� 3
DECLARE
   vname varchar2(20);
   vfood varchar2(20);
   vprice number(7);
BEGIN
  select person_name,fname,fprice
  into vname,vfood,vprice
  from food f,person p
  where f.food_num=p.food_num and person_num=9;
  
   DBMS_Output.put_line('�ֹ���:'||vname);
   DBMS_Output.put_line('�޴���:'||vfood);
   DBMS_Output.put_line('��  ��:'||vprice||'��');   
end;
/

--����4
-- ��ǰ���� ������ �������� �ش� ��ǰ���� ���ݰ� ������ ���
DECLARE
   vsangpum varchar2(20) := 'û����';
   vcolor varchar2(20);
   vprice number(7);
   vprice2 varchar2(20);
BEGIN
  select sang_price,sang_color,ltrim(to_char(sang_price,'L999,999'))
  into vprice,vcolor,vprice2
  from shop where sang_name=vsangpum;
  
   DBMS_Output.put_line('��ǰ��:'||vsangpum);
   DBMS_Output.put_line('��  ��:'||vcolor);
   DBMS_Output.put_line('��  ��:'||vprice);  
   DBMS_Output.put_line('��  ��:'||vprice2);  
end;
/

/*
if  ���ǽ� then
    ����1;
else
    ����2;
end if;

���� if��
if ���ǽ�1 then
   ����1;
elsif ����2 then
   ����2;
   ...
end if;

*/

--����5
--�⵵�� �´� �챸�ϱ�

--Ű����� �⵵�� �Է¹ް��� �Ұ��
accept year prompt '�¾ �⵵�� �Է��ϼ���';
DECLARE
   --v_year number(4) := 1989;
   v_year number(4) := '&year'; --�Է��Ѱ��� ����
   v_mod number(2) := mod(v_year,12); --�⵵�� 12�� ���� �������� ���Ѵ�
   v_ddi varchar2(10); --�� ������ ����   
BEGIN
   if v_mod=0 then v_ddi:='������';
   elsif v_mod=1 then v_ddi:='��';
   elsif v_mod=2 then v_ddi:='��';
   elsif v_mod=3 then v_ddi:='����';
   elsif v_mod=4 then v_ddi:='��';
   elsif v_mod=5 then v_ddi:='��';
   elsif v_mod=6 then v_ddi:='ȣ����';
   elsif v_mod=7 then v_ddi:='�䳢';
   elsif v_mod=8 then v_ddi:='��';   
   elsif v_mod=9 then v_ddi:='��';   
   elsif v_mod=10 then v_ddi:='��';
   elsif v_mod=11 then v_ddi:='��';
   end if;
   DBMS_Output.put_line(v_year||'����� '||v_ddi||'���Դϴ�');
end;
/

--���� 6
--db �÷��� Ÿ���� �������� ��� TYPE
accept iname prompt 'name?';
DECLARE
   v_name student.name%TYPE :='&iname';
   v_height student.height%TYPE;
   v_java student.java%TYPE;
   v_spring student.spring%TYPE;   
BEGIN
  select height,java,spring
  into v_height,v_java,v_spring
  from student where name=v_name;
 
  DBMS_Output.put_line('�л���:'||v_name);
  DBMS_Output.put_line('Ű:'||v_height);
  DBMS_Output.put_line('�ڹ�����:'||v_java);
  DBMS_Output.put_line('����������:'||v_spring); 
  DBMS_Output.put_line('����:'||(v_java+v_spring));  
end;
/

/*
  �ݺ��� : loop
  loop
     �����;
     exit when ����;
   end loop;
*/
--1���� 10���� �ݺ��ؼ� ���
--���� 7
DECLARE
   v_no number(2) := 0;   
BEGIN
   loop
       v_no := v_no+1;
       DBMS_Output.put_line('no='||v_no);
       exit when v_no=10; --10�ϰ�� �ݺ����� ����������
   end loop;   
end;
/

--����: ���� �Է��ϸ� �ش���� ����Ͻÿ�
--���� 8
accept dan prompt 'dan?';
DECLARE
   v_dan number(2) := '&dan';
   v_idx number(1) := 1;
BEGIN    
   DBMS_Output.put_line('** '||v_dan||' �� **');
   loop       
       DBMS_Output.put_line(v_dan || 'X' || v_idx || '=' || v_dan*v_idx);
       v_idx := v_idx+1;
       exit when v_idx=10;
   end loop;
end;
/

-- ��ǰ���� ������ �������� �ش� ��ǰ���� ���ݰ� ������ ���
--���� 9 - Exception ó��(���� 4 ����)
accept sangpum prompt 'sangpum?';
DECLARE
   vsangpum varchar2(20) := '&sangpum';
   vcolor varchar2(20);
   vprice number(7);
   vprice2 varchar2(20);
BEGIN
  select sang_price,sang_color,ltrim(to_char(sang_price,'L999,999'))
  into vprice,vcolor,vprice2
  from shop where sang_name=vsangpum;
  
   DBMS_Output.put_line('��ǰ��:'||vsangpum);
   DBMS_Output.put_line('��  ��:'||vcolor);
   DBMS_Output.put_line('��  ��:'||vprice);  
   DBMS_Output.put_line('��  ��:'||vprice2);  
   
   --����� 2�� �̻��̰ų� ������ �����߻�
   --����Ŭ���� ����ó���ϴ� ���
   EXCEPTION
      when NO_DATA_FOUND then
         DBMS_Output.put_line(vsangpum||' ��ǰ�� DB �� �����ϴ�');
      when TOO_MANY_ROWS then
         DBMS_Output.put_line(vsangpum||' ��ǰ�� DB �� �ΰ��̻� �����մϴ�');
      when OTHERS then
        DBMS_Output.put_line(vsangpum||' ��ǰ�� ���� ���� �߻�-���� ��');   
end;
/

















