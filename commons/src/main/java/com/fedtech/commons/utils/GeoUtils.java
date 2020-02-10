package com.fedtech.commons.utils;



import com.fedtech.commons.data.Point;

import java.util.ArrayList;
import java.util.List;


/**
 * Created by Administrator on 2016/8/4.
 * 用来帮助用户判断点、多边形线、多边形面的关系(经纬度)
 */
public class GeoUtils {

    /**
     * 地球半径
     */
    static double EARTHRADIUS = 6370996.81;

    /**
     * 判断点是否多边形内
     * @param {Point} point 点对象
     * @param {List<Point>} pts  多边形对象
     * @returns {Boolean} 点在多边形内返回true,否则返回false
     */
    public static boolean isPointInPolygon(Point point, List<Point> pts  )
    {
        if(!ObjectUtils.isNotNull(pts))
            return false;

        int N=pts.size();
        boolean boundOrVertex = true; //如果点位于多边形的顶点或边上，也算做点在多边形内，直接返回true
        int intersectCount = 0;//cross points count of x
        double precision = 2e-10; //浮点类型计算时候与0比较时候的容差
        Point p1, p2;//neighbour bound vertices
        Point p = point; //测试点
        p1 = pts.get(0);//left vertex

        for(int i=0;i<N;i++)
        {
            if(p.equals(p1))
                return boundOrVertex;

            p2=pts.get(i%N);
            if(p.getLat() < Math.min(p1.getLat(), p2.getLat()) || p.getLat() > Math.max(p1.getLat(), p2.getLat())){//ray is outside of our interests
                p1 = p2;
                continue;//next ray left point
            }
            if(p.getLat() > Math.min(p1.getLat(), p2.getLat()) && p.getLat() < Math.max(p1.getLat(), p2.getLat())){//ray is crossing over by the algorithm (common part of)
                if(p.getLng() <= Math.max(p1.getLng(), p2.getLng())){//x is before of ray
                    if(p1.getLat() == p2.getLat() && p.getLng() >= Math.min(p1.getLng(), p2.getLng())){//overlies on a horizontal ray
                        return boundOrVertex;
                    }

                    if(p1.getLng() == p2.getLng()){//ray is vertical
                        if(p1.getLng() == p.getLng()){//overlies on a vertical ray
                            return boundOrVertex;
                        }else{//before ray
                            ++intersectCount;
                        }
                    }else{//cross point on the left side
                        double xinters = (p.getLat() - p1.getLat()) * (p2.getLng() - p1.getLng()) / (p2.getLat() - p1.getLat()) + p1.getLng();//cross point of getLng()
                        if(Math.abs(p.getLng() - xinters) < precision){//overlies on a ray
                            return boundOrVertex;
                        }

                        if(p.getLng() < xinters){//before ray
                            ++intersectCount;
                        }
                    }
                }
            }else{//special case when ray is crossing through the vertex
                if(p.getLat() == p2.getLat() && p.getLng() <= p2.getLng()){//p crossing over p2
                    Point p3 = pts.get((i+1) % N); //next vertex
                    if(p.getLat() >= Math.min(p1.getLat(), p3.getLat()) && p.getLat() <= Math.max(p1.getLat(), p3.getLat())){//p.getLat() lies between p1.getLat() & p3.getLat()
                        ++intersectCount;
                    }else{
                        intersectCount += 2;
                    }
                }
            }
            p1 = p2;//next ray left point
        }
        if(intersectCount % 2 == 0){//偶数在多边形外
            return false;
        } else { //奇数在多边形内
            return true;
        }
    }

    /**
     * 点是否在圆
     * @param point point 点对象
     * @param center 园的中心坐标
     * @param radius 园的半径
     * @return
     */
    public static boolean isPointInCircle(Point point,Point center,double radius)
    {

        double dis =getDistance(point, center);
        if(dis <= radius){
            return true;
        } else {
            return false;
        }

    }


    public static double getDistance(Point point1,Point point2)
    {
        point1.setLng(_getLoop(point1.getLng(), -180, 180));
        point1.setLat(_getRange(point1.getLat(), -74, 74));
        point2.setLng( _getLoop(point2.getLng(), -180, 180));
        point2.setLat(_getRange(point2.getLat(), -74, 74));
        double x1, x2, y1, y2;
        x1 = degreeToRad(point1.getLng());
        y1 = degreeToRad(point1.getLat());
        x2 = degreeToRad(point2.getLng());
        y2 = degreeToRad(point2.getLat());

        return EARTHRADIUS * Math.acos((Math.sin(y1) * Math.sin(y2) + Math.cos(y1) * Math.cos(y2) * Math.cos(x2 - x1)));
    }

    /**
     * 将度转化为弧度
     * @param {degree} Number 度
     * @returns {Number} 弧度
     */
    public static double degreeToRad(double degree)
    {
        return Math.PI * degree/180;
    }

    /**
     * 将v值限定在a,b之间，经度使用
     */
    public static double _getLoop(double v, double a, double b){
        while( v > b){
            v -= b - a;
        }
        while(v < a){
            v += b - a;
        }
        return v;
    }


    /**
     * 将v值限定在a,b之间，纬度使用
     */
    public static double _getRange(double v, double a, double b){
        if(a != 0){
            v = Math.max(v, a);
        }
        if(b != 0){
            v = Math.min(v, b);
        }
        return v;
    }
    public static  void main(String[] args)
    {
        List<Point> points=new ArrayList<>();
        Point pt1 = new Point(118.802947, 32.052492);
        Point pt2 = new Point(118.803306, 32.052745);
        Point pt3 = new Point(118.803935, 32.05273);
        Point pt4 = new Point(118.803872, 32.052263);
        Point pt5 = new Point(118.803845, 32.051873);
        Point pt7 = new Point(118.802839, 32.051873);
            points.add(pt1);
            points.add(pt2);
            points.add(pt3);
            points.add(pt4);
            points.add(pt5);
            points.add(pt7);
            Point pt =new Point(118.803258, 32.052356);
            if(isPointInPolygon(pt,points))
            {
                System.out.println("点在多边形内");
            }
            else
            {
                System.out.println("点在多边形外");

            }

    }
}
