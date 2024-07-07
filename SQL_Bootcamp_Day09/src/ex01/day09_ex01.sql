create or replace function fnc_trg_person_update_audit() returns trigger as $trg_person_update_audit$
begin
    if (TG_OP = 'UPDATE') then
        insert into person_audit
        select current_timestamp at time zone 'Europe/Moscow', 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address;
    end if;
    return null;
end;
$trg_person_update_audit$ language plpgsql;

create trigger trg_person_update_audit
    after update on person
    for each row execute function fnc_trg_person_update_audit();

update person set name = 'Bulat' where id = 10;
update person set name = 'Damir' where id = 10;
