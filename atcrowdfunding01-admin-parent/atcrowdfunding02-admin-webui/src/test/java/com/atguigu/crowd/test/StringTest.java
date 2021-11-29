package com.atguigu.crowd.test;

import com.atguigu.crowd.util.CrowdUtil;
import org.junit.Test;

import java.io.*;

/**
 * @author gxl
 * @description
 * @createDate 2021/10/31 20:42
 */
public class StringTest {

    @Test
    public void testMd5() throws IOException {
        String source = "123123";
        String encoded = CrowdUtil.md5(source);
        System.out.println(encoded);

        File file = new File("D:\\Java\\ProjectTraining\\test\\123123.txt");
        FileReader fr = new FileReader(file);
        char[] buff = new char[1024];
        int length = 0;
        while ((length=fr.read(buff)) != -1){
            String text = new String(buff, 0, length);
            System.out.println(text);
            String encoded2 = CrowdUtil.md5(text);
            System.out.println(encoded2);
        }
        fr.close();
    }
}
