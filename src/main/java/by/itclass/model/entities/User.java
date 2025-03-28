package by.itclass.model.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@RequiredArgsConstructor
@Getter
public class User {
    private int id;
    @NonNull private String name;
    @NonNull private String login;
    @NonNull private String email;
    @NonNull private char[] password;

    public User(@NonNull String name, @NonNull String login) {
        this.name = name;
        this.login = login;
    }
}
