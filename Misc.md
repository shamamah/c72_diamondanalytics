# Misc

Put your documentation here! Your text is rendered with [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown).

Click the "Edit Source" button above to make changes.

One way to do this is with the sql_table_name parameter. We could do something like
sql_table_name: SELECT * FROM table WHERE {% condition filter_name %} sql_or_lookml_reference {% endcondition %}

That's similar to creating another derived table where the results are limited when we start running queries.

Alternatively, we can use similar logic in a sql_always_where at the explore level. Here is the doc on that for reference: https://docs.looker.com/reference/explore-params/sql_always_where

We can do something like
sql_always_where: {% condition filter_name %} sql_or_lookml_reference {% endcondition %}
