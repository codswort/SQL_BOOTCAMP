create or replace function fnc_trg_person_audit() returns trigger as $trg_person_audit$
begin
    if (TG_OP = 'INSERT') then
        insert into person_audit
        select current_timestamp at time zone 'Europe/Moscow', 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address;
    elsif (TG_OP = 'UPDATE') then
        insert into person_audit
        select current_timestamp at time zone 'Europe/Moscow', 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address;
    elsif (TG_OP = 'DELETE') then
        insert into person_audit
        select current_timestamp at time zone 'Europe/Moscow', 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address;
    end if;
    return null;
end;
$trg_person_audit$ language plpgsql;

create trigger  trg_person_audit
    after insert or update or delete on person
    for each row execute function fnc_trg_person_audit();

drop trigger if exists trg_person_insert_audit on person;
drop trigger if exists trg_person_update_audit on person;
drop trigger if exists trg_person_delete_audit on person;

drop function if exists  fnc_trg_person_insert_audit();
drop function if exists  fnc_trg_person_update_audit();
drop function if exists  fnc_trg_person_delete_audit();

truncate person_audit;

INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

DELETE FROM person WHERE id = 10;
