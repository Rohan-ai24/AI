% ---------- Simple Customer Chatbot ----------

start :-
    write('=============================='), nl,
    write(' Customer Support Chatbot'), nl,
    write('=============================='), nl,
    write('Type hello. to start chatting'), nl,
    chat.

chat :-
    read(Input),
    response(Input).

% ---------- Responses ----------

response(hello) :-
    write('Bot : Hello! How can I help you?'), nl,
    chat.

response(product) :-
    write('Bot : We have laptops, mobiles and accessories.'), nl,
    chat.

response(price) :-
    write('Bot : Prices depend on the product model.'), nl,
    chat.

response(order) :-
    write('Bot : Your order will be delivered in 3 to 5 days.'), nl,
    chat.

response(payment) :-
    write('Bot : We accept UPI, debit card and credit card.'), nl,
    chat.

response(thanks) :-
    write('Bot : Welcome! Happy to help you.'), nl,
    chat.

response(bye) :-
    write('Bot : Thank you for visiting.'), nl.

% default response
response(_) :-
    write('Bot : Sorry, I did not understand.'), nl,
    chat.
