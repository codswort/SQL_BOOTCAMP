create table if not exists person_audit(
    created timestamp with time zone not null default current_timestamp,
    type_event char(1) not null default 'I',
    row_id bigint not null,
    name varchar not null,
    age integer not null default 10,
    gender varchar default 'female' not null,
    address varchar,
    constraint ch_type_event check (type_event = 'I' or type_event = 'D' or type_event = 'U')
);

create or replace function fnc_trg_person_insert_audit() returns trigger as $trg_person_insert_audit$
begin
    if (TG_OP = 'INSERT') then
        insert into person_audit
        select current_timestamp at time zone 'Europe/Moscow', 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address;
    end if;
    return null;
end;
$trg_person_insert_audit$ language plpgsql;

create trigger trg_person_insert_audit
    after insert on person
    for each row execute function fnc_trg_person_insert_audit();

insert into person(id, name, age, gender, address)
values (10,'Damir', 22, 'male', 'Irkutsk');
