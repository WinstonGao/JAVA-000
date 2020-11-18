import bean.Teacher;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Map;

public class SpringBeanXmlAired {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationxml.xml");
        
        Map<String, Teacher> beansOfType = context.getBeansOfType(Teacher.class);
        for (Map.Entry<String, Teacher> entry : beansOfType.entrySet()) {
            String s = entry.getKey();
            Teacher teacher = entry.getValue();
            System.out.println("beanName:" + s + ", beanInfo" + teacher.toString());
        }
    }
}
