create or replace package a_analize_db as
  /*=========================================================================*/
  procedure about_db;
  /*=========================================================================*/
  -- Find the db links
  procedure get_db_links;
  /*=========================================================================*/
  -- Get Oracle product version
  procedure get_product_version;
  /*=========================================================================*/
end a_analize_db;
/
create or replace package body a_analize_db as
  /*=========================================================================*/
  gc_line1 constant varchar2(80) := '========================================';
  gc_line2 constant varchar2(80) := '----------------------------------------';
  /*=========================================================================*/
  procedure about_db as
  begin
    get_product_version;
    get_db_links;
  end about_db;
  /*=========================================================================*/
  -- Find the db links
  procedure get_db_links as
    type t_user is table of user_db_links%rowtype index by pls_integer;
    type t_all is table of all_db_links%rowtype index by pls_integer;
    tr_user t_user;
    tr_all  t_all;
  begin
  
    put(gc_line1);
    put('Find the db links');
    put(gc_line2);
    select * bulk collect into tr_user from user_db_links;
    if sql%rowcount = 0 then
      put('User DB links not found.');
    else
      put('User DB links: ');
    end if;
  
    put(gc_line2);
    for i in 1 .. tr_user.count loop
      put('db_link = [' || tr_user(i).db_link || '], username = [' || tr_user(i)
          .username || '], host = [' || tr_user(i).host || '], created = [' ||
          to_char(tr_user(i).created, 'dd.mm.rrrr hh24:mi:ss') || ']');
    end loop;
    put(gc_line2);
  
    select * bulk collect into tr_all from all_db_links;
    if sql%rowcount = 0 then
      put('Any DB links not found.');
    else
      put('All DB links: ');
    end if;
  
    put(gc_line2);
    for i in 1 .. tr_all.count loop
      put('db_link = [' || tr_all(i).db_link || '], username = [' || tr_all(i)
          .username || '], host = [' || tr_all(i).host || '], created = [' ||
          to_char(tr_all(i).created, 'dd.mm.rrrr hh24:mi:ss') || ']');
    end loop;
    put(gc_line1);
  
  end get_db_links;
  /*=========================================================================*/
  -- Get Oracle product version
  procedure get_product_version as
  begin
    put(gc_line1);
    put('Get Oracle product version');
    put(gc_line2);
    for i in (select * from v$version) loop
      put('banner = [' || i.banner || ']');
    end loop;
    put(gc_line1);
  end get_product_version;
  /*=========================================================================*/

end a_analize_db;
/
