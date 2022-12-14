create table if not exists global_variable_food_ingredient
(
    id                                 int unsigned auto_increment
        primary key,
    food_global_variable_id            int unsigned                        not null comment 'This is the id of the food or composite variable being tagged with an ingredient.',
    ingredient_global_variable_id      int unsigned                        not null comment 'This is the id of the ingredient variable whose value is inferred based on the value of the food or composite variable.',
    number_of_data_points              int(10)                             null comment 'The number of data points used to estimate the mean ingredient concentration from testing.',
    standard_error                     float                               null comment 'Measure of variability of the 
mean value as a function of the number of data points.',
    ingredient_global_variable_unit_id smallint unsigned                   null comment 'The id for the unit of the tag (ingredient) variable.',
    food_global_variable_unit_id       smallint unsigned                   null comment 'The unit id for the food or composite variable to be tagged.',
    conversion_factor                  double                              not null comment 'Number by which we multiply the food or composite variable''s value to obtain the ingredient variable''s value',
    client_id                          varchar(80)                         null,
    created_at                         timestamp default CURRENT_TIMESTAMP not null,
    updated_at                         timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    deleted_at                         timestamp                           null,
    constraint UK_tag_tagged
        unique (food_global_variable_id, ingredient_global_variable_id),
    constraint common_tags_client_id_fk
        foreign key (client_id) references oa_clients (client_id),
    constraint common_tags_tag_variable_id_variables_id_fk
        foreign key (ingredient_global_variable_id) references global_variables (id),
    constraint common_tags_tag_variable_unit_id_fk
        foreign key (ingredient_global_variable_unit_id) references units (id),
    constraint common_tags_tagged_variable_id_variables_id_fk
        foreign key (food_global_variable_id) references global_variables (id),
    constraint common_tags_tagged_variable_unit_id_fk
        foreign key (food_global_variable_unit_id) references units (id)
)
    comment 'Variable tags are used to infer the user intake of the different ingredients by just entering the foods. The inferred intake levels will then be used to determine the effects of different nutrients on the user during analysis.'
    charset = utf8;

