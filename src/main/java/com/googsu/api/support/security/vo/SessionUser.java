package com.googsu.api.support.security.vo;

import java.io.Serializable;

import com.googsu.api.domain.user.User;

import lombok.Getter;

@SuppressWarnings("serial")
@Getter
public class SessionUser implements Serializable {
    private String name;
    private String email;
    private String picture;

    public SessionUser(User user) {
        this.name = user.getName();
        this.email = user.getEmail();
        this.picture = user.getPicture();
    }
}