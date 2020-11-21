package bean;

import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import java.util.Objects;

@Component
public class Teacher {
    private String name;
    private String mobile;
    private String sex;


    public Teacher() {
    }

    public Teacher(String name, String mobile, String sex) {
        this.name = name;
        this.mobile = mobile;
        this.sex = sex;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Teacher teacher = (Teacher) o;
        return name.equals(teacher.name) &&
                mobile.equals(teacher.mobile) &&
                Objects.equals(sex, teacher.sex);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, mobile);
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "name='" + name + '\'' +
                ", mobile='" + mobile + '\'' +
                ", sex='" + sex + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
}
