
package com.controller;

import java.io.File;
import java.math.BigDecimal;
import java.net.URL;
import java.text.SimpleDateFormat;
import com.alibaba.fastjson.JSONObject;
import java.util.*;
import org.springframework.beans.BeanUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.ContextLoader;
import javax.servlet.ServletContext;
import com.service.TokenService;
import com.utils.*;
import java.lang.reflect.InvocationTargetException;

import com.service.DictionaryService;
import org.apache.commons.lang3.StringUtils;
import com.annotation.IgnoreAuth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.*;
import com.entity.view.*;
import com.service.*;
import com.utils.PageUtils;
import com.utils.R;
import com.alibaba.fastjson.*;

/**
 * 商品
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/meizhuang")
public class MeizhuangController {
    private static final Logger logger = LoggerFactory.getLogger(MeizhuangController.class);

    @Autowired
    private MeizhuangService meizhuangService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;

    //级联表service
    @Autowired
    private ShangjiaService shangjiaService;

    @Autowired
    private YonghuService yonghuService;


    /**
    * 后端列表
    */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("page方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永不会进入");
        else if("用户".equals(role))
            params.put("yonghuId",request.getSession().getAttribute("userId"));
        else if("商家".equals(role))
            params.put("shangjiaId",request.getSession().getAttribute("userId"));
        params.put("meizhuangDeleteStart",1);params.put("meizhuangDeleteEnd",1);
        if(params.get("orderBy")==null || params.get("orderBy")==""){
            params.put("orderBy","id");
        }
        PageUtils page = meizhuangService.queryPage(params);

        //字典表数据转换
        List<MeizhuangView> list =(List<MeizhuangView>)page.getList();
        for(MeizhuangView c:list){
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(c, request);
        }
        return R.ok().put("data", page);
    }

    /**
    * 后端详情
    */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("info方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        MeizhuangEntity meizhuang = meizhuangService.selectById(id);
        if(meizhuang !=null){
            //entity转view
            MeizhuangView view = new MeizhuangView();
            BeanUtils.copyProperties( meizhuang , view );//把实体数据重构到view中

                //级联表
                ShangjiaEntity shangjia = shangjiaService.selectById(meizhuang.getShangjiaId());
                if(shangjia != null){
                    BeanUtils.copyProperties( shangjia , view ,new String[]{ "id", "createTime", "insertTime", "updateTime"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setShangjiaId(shangjia.getId());
                }
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view, request);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }

    }

    /**
    * 后端保存
    */
    @RequestMapping("/save")
    public R save(@RequestBody MeizhuangEntity meizhuang, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,meizhuang:{}",this.getClass().getName(),meizhuang.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");
        else if("商家".equals(role))
            meizhuang.setShangjiaId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));

        Wrapper<MeizhuangEntity> queryWrapper = new EntityWrapper<MeizhuangEntity>()
            .eq("shangjia_id", meizhuang.getShangjiaId())
            .eq("meizhuang_uuid_number", meizhuang.getMeizhuangUuidNumber())
            .eq("meizhuang_name", meizhuang.getMeizhuangName())
            .eq("meizhuang_pinpai", meizhuang.getMeizhuangPinpai())
            .eq("meizhuang_types", meizhuang.getMeizhuangTypes())
            .eq("meizhuang_erji_types", meizhuang.getMeizhuangErjiTypes())
            .eq("meizhuang_price", meizhuang.getMeizhuangPrice())
            .eq("meizhuang_kucun_number", meizhuang.getMeizhuangKucunNumber())
            .eq("meizhuang_clicknum", meizhuang.getMeizhuangClicknum())
            .eq("meizhuang_yesno_types", meizhuang.getMeizhuangYesnoTypes())
            .eq("shangxia_types", meizhuang.getShangxiaTypes())
            .eq("meizhuang_delete", meizhuang.getMeizhuangDelete())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        MeizhuangEntity meizhuangEntity = meizhuangService.selectOne(queryWrapper);
        if(meizhuangEntity==null){
            meizhuang.setMeizhuangClicknum(1);
            meizhuang.setMeizhuangYesnoTypes(1);
            meizhuang.setShangxiaTypes(1);
            meizhuang.setMeizhuangDelete(1);
            meizhuang.setCreateTime(new Date());
            meizhuangService.insert(meizhuang);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody MeizhuangEntity meizhuang, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,meizhuang:{}",this.getClass().getName(),meizhuang.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
//        else if("商家".equals(role))
//            meizhuang.setShangjiaId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));
        //根据字段查询是否有相同数据
        Wrapper<MeizhuangEntity> queryWrapper = new EntityWrapper<MeizhuangEntity>()
            .notIn("id",meizhuang.getId())
            .andNew()
            .eq("shangjia_id", meizhuang.getShangjiaId())
            .eq("meizhuang_uuid_number", meizhuang.getMeizhuangUuidNumber())
            .eq("meizhuang_name", meizhuang.getMeizhuangName())
            .eq("meizhuang_pinpai", meizhuang.getMeizhuangPinpai())
            .eq("meizhuang_types", meizhuang.getMeizhuangTypes())
            .eq("meizhuang_erji_types", meizhuang.getMeizhuangErjiTypes())
            .eq("meizhuang_price", meizhuang.getMeizhuangPrice())
            .eq("meizhuang_kucun_number", meizhuang.getMeizhuangKucunNumber())
            .eq("meizhuang_clicknum", meizhuang.getMeizhuangClicknum())
            .eq("meizhuang_yesno_types", meizhuang.getMeizhuangYesnoTypes())
            .eq("shangxia_types", meizhuang.getShangxiaTypes())
            .eq("meizhuang_delete", meizhuang.getMeizhuangDelete())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        MeizhuangEntity meizhuangEntity = meizhuangService.selectOne(queryWrapper);
        if("".equals(meizhuang.getMeizhuangPhoto()) || "null".equals(meizhuang.getMeizhuangPhoto())){
                meizhuang.setMeizhuangPhoto(null);
        }
        if(meizhuangEntity==null){
            meizhuangService.updateById(meizhuang);//根据id更新
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }


    /**
    * 审核
    */
    @RequestMapping("/shenhe")
    public R shenhe(@RequestBody MeizhuangEntity meizhuangEntity, HttpServletRequest request){
        logger.debug("shenhe方法:,,Controller:{},,meizhuangEntity:{}",this.getClass().getName(),meizhuangEntity.toString());

//        if(meizhuangEntity.getMeizhuangYesnoTypes() == 2){//通过
//            meizhuangEntity.setMeizhuangTypes();
//        }else if(meizhuangEntity.getMeizhuangYesnoTypes() == 3){//拒绝
//            meizhuangEntity.setMeizhuangTypes();
//        }
        meizhuangService.updateById(meizhuangEntity);//审核
        return R.ok();
    }

    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        ArrayList<MeizhuangEntity> list = new ArrayList<>();
        for(Integer id:ids){
            MeizhuangEntity meizhuangEntity = new MeizhuangEntity();
            meizhuangEntity.setId(id);
            meizhuangEntity.setMeizhuangDelete(2);
            list.add(meizhuangEntity);
        }
        if(list != null && list.size() >0){
            meizhuangService.updateBatchById(list);
        }
        return R.ok();
    }


    /**
     * 批量上传
     */
    @RequestMapping("/batchInsert")
    public R save( String fileName, HttpServletRequest request){
        logger.debug("batchInsert方法:,,Controller:{},,fileName:{}",this.getClass().getName(),fileName);
        Integer yonghuId = Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId")));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            List<MeizhuangEntity> meizhuangList = new ArrayList<>();//上传的东西
            Map<String, List<String>> seachFields= new HashMap<>();//要查询的字段
            Date date = new Date();
            int lastIndexOf = fileName.lastIndexOf(".");
            if(lastIndexOf == -1){
                return R.error(511,"该文件没有后缀");
            }else{
                String suffix = fileName.substring(lastIndexOf);
                if(!".xls".equals(suffix)){
                    return R.error(511,"只支持后缀为xls的excel文件");
                }else{
                    URL resource = this.getClass().getClassLoader().getResource("static/upload/" + fileName);//获取文件路径
                    File file = new File(resource.getFile());
                    if(!file.exists()){
                        return R.error(511,"找不到上传文件，请联系管理员");
                    }else{
                        List<List<String>> dataList = PoiUtil.poiImport(file.getPath());//读取xls文件
                        dataList.remove(0);//删除第一行，因为第一行是提示
                        for(List<String> data:dataList){
                            //循环
                            MeizhuangEntity meizhuangEntity = new MeizhuangEntity();
//                            meizhuangEntity.setShangjiaId(Integer.valueOf(data.get(0)));   //商家 要改的
//                            meizhuangEntity.setMeizhuangUuidNumber(data.get(0));                    //商品编号 要改的
//                            meizhuangEntity.setMeizhuangName(data.get(0));                    //商品名称 要改的
//                            meizhuangEntity.setMeizhuangPhoto("");//详情和图片
//                            meizhuangEntity.setMeizhuangPinpai(data.get(0));                    //品牌 要改的
//                            meizhuangEntity.setMeizhuangTypes(Integer.valueOf(data.get(0)));   //商品类型 要改的
//                            meizhuangEntity.setMeizhuangErjiTypes(Integer.valueOf(data.get(0)));   //商品二级类型 要改的
//                            meizhuangEntity.setMeizhuangPrice(Integer.valueOf(data.get(0)));   //购买获得积分 要改的
//                            meizhuangEntity.setMeizhuangKucunNumber(Integer.valueOf(data.get(0)));   //商品库存 要改的
//                            meizhuangEntity.setMeizhuangOldMoney(data.get(0));                    //商品原价 要改的
//                            meizhuangEntity.setMeizhuangNewMoney(data.get(0));                    //现价 要改的
//                            meizhuangEntity.setMeizhuangClicknum(Integer.valueOf(data.get(0)));   //点击次数 要改的
//                            meizhuangEntity.setMeizhuangYesnoTypes(Integer.valueOf(data.get(0)));   //商品审核 要改的
//                            meizhuangEntity.setMeizhuangContent("");//详情和图片
//                            meizhuangEntity.setShangxiaTypes(Integer.valueOf(data.get(0)));   //是否上架 要改的
//                            meizhuangEntity.setMeizhuangDelete(1);//逻辑删除字段
//                            meizhuangEntity.setCreateTime(date);//时间
                            meizhuangList.add(meizhuangEntity);


                            //把要查询是否重复的字段放入map中
                                //商品编号
                                if(seachFields.containsKey("meizhuangUuidNumber")){
                                    List<String> meizhuangUuidNumber = seachFields.get("meizhuangUuidNumber");
                                    meizhuangUuidNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> meizhuangUuidNumber = new ArrayList<>();
                                    meizhuangUuidNumber.add(data.get(0));//要改的
                                    seachFields.put("meizhuangUuidNumber",meizhuangUuidNumber);
                                }
                        }

                        //查询是否重复
                         //商品编号
                        List<MeizhuangEntity> meizhuangEntities_meizhuangUuidNumber = meizhuangService.selectList(new EntityWrapper<MeizhuangEntity>().in("meizhuang_uuid_number", seachFields.get("meizhuangUuidNumber")).eq("meizhuang_delete", 1));
                        if(meizhuangEntities_meizhuangUuidNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(MeizhuangEntity s:meizhuangEntities_meizhuangUuidNumber){
                                repeatFields.add(s.getMeizhuangUuidNumber());
                            }
                            return R.error(511,"数据库的该表中的 [商品编号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        meizhuangService.insertBatch(meizhuangList);
                        return R.ok();
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return R.error(511,"批量插入数据异常，请联系管理员");
        }
    }





    /**
    * 前端列表
    */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("list方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));

        // 没有指定排序字段就默认id倒序
        if(StringUtil.isEmpty(String.valueOf(params.get("orderBy")))){
            params.put("orderBy","id");
        }
        PageUtils page = meizhuangService.queryPage(params);

        //字典表数据转换
        List<MeizhuangView> list =(List<MeizhuangView>)page.getList();
        for(MeizhuangView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段
        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        MeizhuangEntity meizhuang = meizhuangService.selectById(id);
            if(meizhuang !=null){

                //点击数量加1
                meizhuang.setMeizhuangClicknum(meizhuang.getMeizhuangClicknum()+1);
                meizhuangService.updateById(meizhuang);

                //entity转view
                MeizhuangView view = new MeizhuangView();
                BeanUtils.copyProperties( meizhuang , view );//把实体数据重构到view中

                //级联表
                    ShangjiaEntity shangjia = shangjiaService.selectById(meizhuang.getShangjiaId());
                if(shangjia != null){
                    BeanUtils.copyProperties( shangjia , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setShangjiaId(shangjia.getId());
                }
                //修改对应字典表字段
                dictionaryService.dictionaryConvert(view, request);
                return R.ok().put("data", view);
            }else {
                return R.error(511,"查不到数据");
            }
    }


    /**
    * 前端保存
    */
    @RequestMapping("/add")
    public R add(@RequestBody MeizhuangEntity meizhuang, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,meizhuang:{}",this.getClass().getName(),meizhuang.toString());
        Wrapper<MeizhuangEntity> queryWrapper = new EntityWrapper<MeizhuangEntity>()
            .eq("shangjia_id", meizhuang.getShangjiaId())
            .eq("meizhuang_uuid_number", meizhuang.getMeizhuangUuidNumber())
            .eq("meizhuang_name", meizhuang.getMeizhuangName())
            .eq("meizhuang_pinpai", meizhuang.getMeizhuangPinpai())
            .eq("meizhuang_types", meizhuang.getMeizhuangTypes())
            .eq("meizhuang_erji_types", meizhuang.getMeizhuangErjiTypes())
            .eq("meizhuang_price", meizhuang.getMeizhuangPrice())
            .eq("meizhuang_kucun_number", meizhuang.getMeizhuangKucunNumber())
            .eq("meizhuang_clicknum", meizhuang.getMeizhuangClicknum())
            .eq("meizhuang_yesno_types", meizhuang.getMeizhuangYesnoTypes())
            .eq("shangxia_types", meizhuang.getShangxiaTypes())
            .eq("meizhuang_delete", meizhuang.getMeizhuangDelete())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        MeizhuangEntity meizhuangEntity = meizhuangService.selectOne(queryWrapper);
        if(meizhuangEntity==null){
            meizhuang.setMeizhuangYesnoTypes(1);
            meizhuang.setMeizhuangDelete(1);
            meizhuang.setCreateTime(new Date());
        meizhuangService.insert(meizhuang);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }


}
