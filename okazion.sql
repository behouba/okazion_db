
-- set timezone to 'GMT';

CREATE TABLE account_state
(
    account_state_id SERIAL PRIMARY KEY,
    account_state VARCHAR NOT NULL
)

CREATE TABLE message_type
(
    message_type_id SERIAL PRIMARY KEY,
    message_type VARCHAR NOT NULL
)

CREATE TABLE auth_type
(
    auth_type_id SERIAL PRIMARY KEY,
    auth_type VARCHAR NOT NULL
)

CREATE TABLE user_type
(
    user_type_id SERIAL PRIMARY KEY,
    user_type VARCHAR NOT NULL
)

CREATE TABLE category
(
    category_id SERIAL PRIMARY KEY,
    category VARCHAR NOT NULL,
    parent_id SERIAL NOT NULL REFERENCES category(category_id)
)

CREATE TABLE advert_condition
(
    advert_condition_id SERIAL PRIMARY KEY,
    advert_condition VARCHAR NOT NULL,
)

CREATE TABLE advert_type
(
    advert_type_id SERIAL PRIMARY KEY,
    advert_type VARCHAR NOT NULL,
)

CREATE TABLE social_media
(
    social_media_id SERIAL PRIMARY KEY,
    social_media VARCHAR NOT NULL,
)

CREATE TABLE advert_state
(
    advert_state_id SERIAL PRIMARY KEY,
    advert_state VARCHAR NOT NULL,
)

CREATE TABLE auction_type
(
    auction_type_id SERIAL PRIMARY KEY,
    auction_type VARCHAR NOT NULL
)

CREATE TABLE region
(
    region_id SERIAL PRIMARY KEY,
    region VARCHAR NOT NULL
)

CREATE TABLE city
(
    city_id SERIAL PRIMARY KEY,
    city VARCHAR NOT NULL
)

CREATE TABLE users
(
    user_id SERIAL PRIMARY KEY,
    email VARCHAR,
    password VARCHAR NOT NULL,
    profile_picture VARCHAR,
    background_picture VARCHAR,
    account_type_id INTEGER,
    city_id INTEGER,
    verified_user_id INTEGER,
    account_state_id INTEGER,
    auth_type_id INTEGER,
)

CREATE TABLE contact
(
    user_id INTEGER REFERENCES users (user_id),
    contact VARCHAR NOT NULL,
)

CREATE TABLE user_session
(
    user_session_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users (user_id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    last_activity TIMESTAMPTZ NOT NULL DEFAULT NOW()
)

CREATE TABLE chat_room
(
    chat_room_id SERIAL PRIMARY KEY,
    user_1 INTEGER REFERENCES users (user_id),
    user_2 INTEGER REFERENCES users (user_id),
    CHECK(user_2 != user_1)
)

CREATE TABLE chat_message
(
    chat_message_id SERIAL PRIMARY KEY,
    chat_room_id INTEGER REFERENCES chat_room (chat_room_id),
    user_id INTEGER REFERENCES users (user_id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    body VARCHAR NOT NULL,
    message_type_id INTEGER REFERENCES message_type (message_type_id),
    is_readed BOOLEAN NOT NULL
)

-- CREATE TYPE rating AS ENUM (1, 2, 3, 4, 5);

CREATE TABLE evaluation
(
    evaluation_id SERIAL PRIMARY KEY,
    evaluation_rating rating NOT NULL,
    comment TEXT,
    from_user_id INTEGER NOT NULL REFERENCES users (user_id),
    for_user_id INTEGER NOT NULL REFERENCES users (user_id),
    PRIMARY KEY (from_user_id, for_user_id),
    -- check if the order matter for uniqueness in this table on evaluation by user to another user
    CHECK(from_user_id != for_user_id)
)





CREATE TABLE advert
(
    advert_id SERIAL PRIMARY KEY,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    title VARCHAR NOT NULL,
    description TEXT,
    user_id INTEGER NOT NULL REFERENCES users (user_id),
    category INTEGER NOT NULL REFERENCES category (category_id),
    advert_conditon_id INTEGER NOT NULL REFERENCES advert_condition (advert_condition_id),
    city_id INTEGER NOT NULL REFERENCES city (city_id),
    advert_state_id INTEGER NOT NULL REFERENCES advert_state (advert_state_id),
    advert_type_id INTEGER NOT NULL REFERENCES advert_type (advert_type_id),
    price NUMERIC,
)

CREATE TABLE advert_picture
(
    advert_picture_id SERIAL PRIMARY KEY,
    advert_id INTEGER NOT NULL REFERENCES advert(advert_id),
    url VARCHAR NOT NULL,
)

CREATE TABLE advert_attribute
(
    advert_id INTEGER NOT NULL REFERENCES advert(advert_id),
    advert_attribute JSON NOT NULL
)


CREATE TABLE auction
(
    auction_id SERIAL PRIMARY KEY,
    auction_type_id INTEGER NOT NULL REFERENCES auction_type(auction_type_id),
    advert_id INTEGER NOT NULL REFERENCES advert (advert_id),
    start_price NUMERIC NOT NULL,
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ NOT NULL CHECK (end_time > start_time)
)

CREATE TABLE deal
(
    advert_id INTEGER NOT NULL REFERENCES advert(advert_id),
    discount_percentage FLOAT NOT NULL,
    description TEXT,
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ NOT NULL CHECK (end_time > start_time)
)

CREATE TABLE bid
(
    bid_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    price NUMERIC NOT NULL,
    auction_id INTEGER NOT NULL REFERENCES auction(auction_id)
)

CREATE TABLE share
(
    advert_id INTEGER NOT NULL REFERENCES advert(advert_id),
    shared_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    user_id INTEGER REFERENCES users(user_id),
    social_media_id INTEGER NOT NULL REFERENCES social_media(social_media_id)
)

CREATE TABLE view
(
    view_id BIGSERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    advert_id INTEGER NOT NULL REFERENCES advert(advert_id),
    viewed_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

)

CREATE TABLE notification
(
    notification_id BIGSERIAL PRIMARY KEY,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    is_readed BOOLEAN NOT NULL,
    notification TEXT NOT NULL,
)

CREATE TABLE archived_advert
(
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    data JSON NOT NULL,
)

CREATE TABLE alert
(
    alert_id BIGSERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    alert_data JSON NOT NULL,
    -- a revoir les donner a stocker pour l'alerte
    create_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
)

CREATE TABLE follow
(
    follow_id SERIAL PRIMARY KEY,
    follower INTEGER NOT NULL REFERENCES users (user_id),
    followed INTEGER NOT NULL REFERENCES users (user_id),
    PRIMARY KEY (follower, followed),
)

CREATE TABLE report
(
    advert_id INTEGER NOT NULL REFERENCES advert(advert_id),
    body TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    sender_contact VARCHAR NOT NULL,
)

CREATE TABLE search
(
    search_id BIGSERIAL PRIMARY KEY,
    -- est ce neccessaire ???
    user_id INTEGER REFERENCES users(user_id),
    keyword VARCHAR NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
)
CREATE TABLE deleted_message(

)

CREATE TABLE job_application(

)

CREATE TABLE tag(

)

CREATE TABLE verified_user
(
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    user_data JSON NOT NULL,
)
CREATE TABLE favorite
(
    user_id INTEGER NOT NULL REFERENCES users (user_id),
    advert_id INTEGER NOT NULL REFERENCES advert (advert_id)
)