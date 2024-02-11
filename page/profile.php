

<style>
.btn-menu {
    background-color: #ffffff;
    margin-top: 10px;
    padding-top: 10px;
    padding-bottom: 10px;
    width: 100%;
    text-align: start;
}
</style>

            <div class="col-lg-8 rounded bg-white m-auto p-5 mt-5">
            <div class="d-flex align-items-center mb-3">
            <div class="col-md-4 col-sm-12 mt-4"></div>
            <div class="col-md-4 col-sm-12 mt-4" data-aos="zoom-in">
    <center>
        <img src="https://cdn.discordapp.com/attachments/1160578369688195105/1199012090489360424/1.png?ex=65c0fe06&is=65ae8906&hm=054663eee86cabe5161712eb8f962ee4a9e7aa0557418e201a08e4e67696eb05&" style="border-color: #7a8288;border-style: solid;border-width: 3px;height: 9.9rem;width: 9.9rem;border-radius: 50%;" alt="a" class="card-img-top img-proflie">
    </center>
    <div class="text-center mt-3">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h4>สวัสดี คุณ <?php echo $user["username"]; ?></h4>
                <p>เป็นสมาชิกเมื่อ : <?php echo $user["date"]; ?></p>
            </div>
            <div class="col-md-12 col-sm-12">
                <?php if($user["rank"] == 1): ?>
                    <span class="badge rounded-pill bg-danger mb-4" style="font-size: 0.9rem;"><i class="fa-solid fa-rocket"></i> สถานะ : Admin</span><br> 
                <?php elseif($user["rank"] == 0): ?>
                    <span class="badge rounded-pill bg-success mb-4" style="font-size: 0.9rem;"><i class="fa-solid fa-rocket"></i> สถานะ : Member</span><br> 
                <?php endif; ?>
                <!-- <span class="badge rounded-pill bg-success mb-4" style="font-size: 0.9rem;"><i class="fa-solid fa-rocket"></i> สถานะ : Member</span><br> -->
                <div>
                <button class="btn btn-light">ยอดเงินคงเหลือ <b class="text-primary">฿<?php echo $user["point"]; ?></b> บาท</button>
                <a class="btn btn-danger" href="?page=logout"><small><img src="assets/icon/enter.png" width="20" class="mb-1">&nbsp;ออกจากระบบ</small></a>
                </div><br>

                <div class="card-header"><i class="fa-solid fa-user-pen"></i> User Info - ข้อมูลผู้ใช้</div>
        <div class="card-body">

            <div class="form-group row">
                <div class="form-group col-md-6">
                    <label class="col-form-label" for="inputDefault"><i class="fa-solid fa-chevron-right"></i> Username (ชื่อผู้ใช้)</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fa-solid fa-envelope"></i></span>
                        <input type="text" class="form-control" disabled placeholder="username" id="username" value="<?php echo $user["username"]; ?>">
                    </div>
                </div>

                <div class="form-group col-md-6">
                    <label class="col-form-label" for="inputDefault"><i class="fa-solid fa-chevron-right"></i> ToTal (ยอดทั้งหมด)</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fa-solid fa-coins"></i></span>
                        <input type="text" class="form-control" disabled placeholder="username" id="username" value="<?php echo $user["total"]; ?>">
                    </div>
                </div>

                
                <br>
                <div class="row">
                <div class="col-mt-5">
                <h4 class="font-bold"></h4>
                <h5 class="font-bold">จัดการโปรไฟล์</h5>
            
                <a href="?page=history" style="text-decoration: none;">
                <div class="container-fluid mb-2 border-hov p-2 pb-1">
                <div class="d-flex">
                <h5 class="text-muted mb-0" style="width: 30px;">
                <i class="bx bx-basket"></i>
                </h5>
                <p class="font-bold text-muted m-0">ประวัติการสั่งซื้อ</p>
                </div>
                </div>
                </a>

                <a href="?page=profile&subpage=cpass" style="text-decoration: none;">
            <div class="container-fluid  mb-2 border-hov p-2 pb-1">
            <div class="d-flex">
            <h5 class="text-muted mb-0" style="width: 30px;"><i class="bx bx-cog"></i></h5>
                    <p class="font-bold text-muted m-0">เปลี่ยนรหัสผ่าน</p>
            </div></div></a>

            </div>
            </div>
            </div>
            </div>

            

            <div class="col-lg">

            <?php 
                if(isset($_GET['subpage']) && $_GET['subpage'] == "cpass"){
                    require_once('page/cpass.php'); 
                }elseif(isset($_GET['subpage']) && $_GET['subpage'] == "topuphis"){
                    require_once('page/topuphis.php');
                }elseif(isset($_GET['subpage']) && $_GET['subpage'] == "buyhis" ){
                    require_once('page/buyhis.php');
                }else{
                    require_once('page/cpass.php');
                }
                ?>
                    

                </div>
                </div></div>
            </div>
        </div>
    </div>
</div>