create table person_discounts
(
id BIGINT primary key ,
person_id BIGINT not null ,
pizzeria_id BIGINT not null ,
discount NUMERIC not null,
constraint fk_person_discounts_person_id foreign key  (person_id) references person(id),
constraint fk_persons_discounts_pizzeria_id foreign key  (pizzeria_id) references pizzeria(id)
);
