package com.ttms.common;

import java.util.Map;

import net.sf.json.JSONObject;



/**
 * 1.json string 转换为 map
 * 2.json string 转换为 对象
 * @author zhangtengda
 *
 */
public class JsonUtil {
    public static void main(String[] args) {
        String jsonStr = "{\"status\":\"0\",\"data\":{\"name\":\"tom\",\"age\":18}}";

        // ================================
        // 1.如果是拿出来最外层的 map
        Map<Object, Object> result = jsonToMap(jsonStr);
        System.out.println(result.get("status"));
        System.out.println(result.get("data"));

        // 2.如果进步一拿到内层的 map
        Map<Object, Object> data = jsonToMap(result.get("data"));
        System.out.println(data.get("name"));
        System.out.println(data.get("age"));
        // ================================

        Long beginTime = System.currentTimeMillis();
        // 3.转换为对象
        String personStr = "{\"id\":12,\"name\":\"mary\"}";
       // Person person = jsonToBean(personStr, Person.class);
       // System.out.println(person);

        System.out.println("耗时："  +( System.currentTimeMillis() - beginTime));

    }

    /**
     * json string 转换为 map 对象
     * @param jsonObj
     * @return
     */
    public static Map<Object, Object> jsonToMap(Object jsonObj) {
        JSONObject jsonObject = JSONObject.fromObject(jsonObj);
        Map<Object, Object> map = (Map)jsonObject;
        return map;
    }

    /**json string 转换为 对象
     * @param jsonObj
     * @param type
     * @return
     */
    public  static <T>  T jsonToBean(Object jsonObj, Class<T> type) {
        JSONObject jsonObject = JSONObject.fromObject(jsonObj);
        T obj =(T)JSONObject.toBean(jsonObject, type);
        return obj;
    } 

}