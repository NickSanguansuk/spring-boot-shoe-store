package com.company.shoe_store.data.entity;

//import jakarta.persistence.*;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Getter
@Setter
//@NoArgsConstructor
@Table(name = "users")
@NamedQueries({
        @NamedQuery(name = "findAllUsersQuery", query = "SELECT u FROM User u"),
        @NamedQuery(name = "findUsersByLastNameQuery", query = "SELECT u FROM User u WHERE u.lastName = :lastNameValue")
})
public class User {
    // Data
    //// "SELECT * FROM users;"
    //public final static String findAllUsersQuery = "SELECT u FROM User u"; // don't need this
    //// "SELECT * FROM users WHERE lastName = ?"
    //public final static String findUsersByLastNameQuery = "SELECT u FROM User u WHERE u.lastName = :lastNameValue"; // don't need this

    //@Basic(optional = false, fetch = FetchType.LAZY)
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    //@Basic(optional = false, fetch = FetchType.LAZY)
    @Basic
    @Column(name = "first_name", nullable = false)
    private String firstName;

    //@Basic(optional = false, fetch = FetchType.LAZY)
    @Basic
    @Column(name = "last_name", nullable = false)
    private String lastName;

    //@Basic(optional = false, fetch = FetchType.LAZY)
    @Basic
    @Column(name = "email", nullable = false)
    private String email;

    //@Basic(optional = false, fetch = FetchType.LAZY)
    @Basic
    @Column(name = "password", nullable = false)
    private String password;

    //@Basic(optional = false, fetch = FetchType.LAZY)
    @Basic
    @Column(name = "phone", nullable = false)
    private String phone;

    //@Basic(optional = false, fetch = FetchType.LAZY)
    @Basic
    @Column(name = "address", nullable = false)
    private String address;

    //@Basic(optional = false, fetch = FetchType.LAZY)
    @Basic
    @Column(name = "city", nullable = false)
    private String city;

    //@Basic(optional = false, fetch = FetchType.LAZY)
    @Basic
    @Column(name = "state", nullable = false)
    private String state;

    //@Basic(optional = false, fetch = FetchType.LAZY)
    @Basic
    @Column(name = "zip_code", nullable = false)
    private String zipCode;

    //@Basic(fetch = FetchType.LAZY)
    @JsonManagedReference
    @OneToMany(mappedBy = "userObject", fetch = FetchType.LAZY)
    //@OneToMany(targetEntity = UserRole.class) // Error
    private List<UserRole> userRoles = new ArrayList<>();

    @JsonManagedReference
    @OneToMany(mappedBy = "userObjectCart", fetch = FetchType.LAZY)
    private List<CartItem> cartItems = new ArrayList<>();

    @JsonManagedReference
    @OneToMany(mappedBy = "userObjectOrder", fetch = FetchType.LAZY)
    private List<Order> orders = new ArrayList<>();

    // Constructors
    public User() {
    }

    //// Getters and Setters
    //public Integer getId() {
    //    return id;
    //}
    //
    //public void setId(Integer id) {
    //    this.id = id;
    //}
    //
    //public String getFirstName() {
    //    return firstName;
    //}
    //
    //public void setFirstName(String firstName) {
    //    this.firstName = firstName;
    //}
    //
    //public String getLastName() {
    //    return lastName;
    //}
    //
    //public void setLastName(String lastName) {
    //    this.lastName = lastName;
    //}
    //
    //public String getEmail() {
    //    return email;
    //}
    //
    //public void setEmail(String email) {
    //    this.email = email;
    //}
    //
    //public String getPassword() {
    //    return password;
    //}
    //
    //public void setPassword(String password) {
    //    this.password = password;
    //}
    //
    //public String getPhone() {
    //    return phone;
    //}
    //
    //public void setPhone(String phone) {
    //    this.phone = phone;
    //}
    //
    //public String getAddress() {
    //    return address;
    //}
    //
    //public void setAddress(String address) {
    //    this.address = address;
    //}
    //
    //public String getCity() {
    //    return city;
    //}
    //
    //public void setCity(String city) {
    //    this.city = city;
    //}
    //
    //public String getState() {
    //    return state;
    //}
    //
    //public void setState(String state) {
    //    this.state = state;
    //}
    //
    //public String getZipCode() {
    //    return zipCode;
    //}
    //
    //public void setZipCode(String zipCode) {
    //    this.zipCode = zipCode;
    //}
    //
    //public List<UserRole> getUserRoles() {
    //    return userRoles;
    //}
    //
    //public void setUserRoles(List<UserRole> userRoles) {
    //    this.userRoles = userRoles;
    //}

    // Methods
    //@Override
    //public String toString() {
    //    return ReflectionToStringBuilder.toString(this, ToStringStyle.MULTI_LINE_STYLE);
    //}
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", city='" + city + '\'' +
                ", state='" + state + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", userRoles=" + userRoles +
                ", cartItems=" + cartItems +
                ", orders=" + orders +
                '}';
    }

    //@Override
    //public boolean equals(Object o) {
    //    if (this == o) return true;
    //    if (o == null || getClass() != o.getClass()) return false;
    //    User user = (User) o;
    //    return Objects.equals(id, user.id) && Objects.equals(firstName, user.firstName) && Objects.equals(lastName, user.lastName) && Objects.equals(email, user.email) && Objects.equals(password, user.password) && Objects.equals(phone, user.phone) && Objects.equals(address, user.address) && Objects.equals(city, user.city) && Objects.equals(state, user.state) && Objects.equals(zipCode, user.zipCode) && Objects.equals(userRoles, user.userRoles);
    //}

    //@Override
    //public int hashCode() {
    //    return Objects.hash(id, firstName, lastName, email, password, phone, address, city, state, zipCode, userRoles);
    //}

}