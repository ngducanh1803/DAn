import { Col, Image, Row } from 'antd';
import moment from 'moment';
import React from 'react';

function CurriculumVitae({ staffInfo }) {
    return (
        <div className="curriculum_vitae">
            <Row>
                <Col span={6}>
                    <Image
                        style={{ width: 150, height: 200 }}
                        src="https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png"
                    />
                </Col>

                <Col span={18}>
                    <div
                        style={{
                            display: 'flex',
                            flexDirection: 'column',
                            justifyContent: 'center',
                            textAlign: 'center',
                        }}
                    >
                        <h4 style={{ fontSize: 20 }}>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</h4>
                        <h5>
                            <span style={{ borderBottom: '2px solid #4d4d4d', paddingBottom: '5px' }}>
                                Độc lập - Tự do - Hạnh Phúc
                            </span>
                        </h5>
                        <h3 style={{ fontSize: 20, marginTop: '30px' }}>SƠ YẾU LÝ LỊCH</h3>
                        <h3 style={{ fontSize: 16 }}>TỰ THUẬT</h3>
                    </div>
                </Col>
            </Row>

            <div style={{ marginTop: '50px' }}>
                <h4>I. THÔNG TIN BẢN THÂN</h4>
                <div style={{ paddingLeft: 15 }}>
                    <p>
                        <span style={{ width: '70%', display: 'inline-block' }}>
                            1. Họ và tên: {staffInfo.fullName}
                        </span>
                        <span>Nam, nữ: {staffInfo.fullName === 0 ? 'Nữ' : 'Nam'}</span>
                    </p>
                    <p>
                        <span style={{ marginRight: '5px' }}>
                            2. Sinh ngày: {moment(staffInfo.dateOfBirth).format('DD')}
                        </span>
                        <span style={{ marginRight: '5px' }}>tháng: {moment(staffInfo.dateOfBirth).format('MM')}</span>
                        <span style={{ marginRight: '5px', padding: '0 5px' }}>
                            năm: {moment(staffInfo.dateOfBirth).format('YYYY')}
                        </span>
                        <span>Nơi sinh: . . . . . . . . . . . . . . . .</span>
                    </p>
                    <p>3. Nguyên quán: {staffInfo.address}</p>
                    <p>
                        <span style={{ width: '30%', display: 'inline-block' }}>4. Số CCCD: . . . .</span>
                        <span style={{ width: '30%', display: 'inline-block' }}>Cấp ngày: . . . .</span>
                        <span>Nơi cấp: . . . .</span>
                    </p>
                    <p>5. Số điện thoại liên hệ: {staffInfo.phone}</p>
                    <p>6. Email: {staffInfo.email}</p>
                    <p>
                        <span style={{ width: '30%', display: 'inline-block' }}>7. Dân tộc: . . . .</span>
                        <span>Tôn giáo: . . . .</span>
                    </p>
                </div>
            </div>

            <div>
                <h4>II. QUAN HỆ GIA ĐÌNH</h4>

                <div style={{ paddingLeft: 15 }}>
                    <p>
                        <span style={{ width: '70%', fontWeight: 600, display: 'inline-block' }}>
                            1. Họ và tên bố: . . .
                        </span>
                        <span style={{ width: '30%', display: 'inline-block' }}>- Năm sinh: . . . . .</span>
                    </p>
                    <p>
                        <span> - Nghề nghiệp hiện nay: . . . . . . .</span>
                    </p>
                    <p> - Chỗ ở hiện nay: . . . .</p>

                    <p>
                        <span style={{ width: '70%', fontWeight: 600, display: 'inline-block' }}>
                            2. Họ và tên mẹ: . . .
                        </span>
                        <span style={{ width: '30%', display: 'inline-block' }}>- Năm sinh: . . . . .</span>
                    </p>
                    <p>
                        <span> - Nghề nghiệp hiện nay: . . . . . . .</span>
                    </p>
                    <p> - Chỗ ở hiện nay: . . . .</p>

                    <p>
                        <span style={{ width: '70%', fontWeight: 600, display: 'inline-block' }}>
                            3. Họ và tên anh/chị/em ruột: . . .
                        </span>
                        <span style={{ width: '30%', display: 'inline-block' }}>- Năm sinh: . . . . .</span>
                    </p>
                    <p>
                        <span> - Nghề nghiệp hiện nay: . . . . . . .</span>
                    </p>
                    <p> - Chỗ ở hiện nay: . . . .</p>

                    <p>
                        <span style={{ width: '70%', fontWeight: 600, display: 'inline-block' }}>
                            4. Họ và tên anh/chị/em ruột: . . .
                        </span>
                        <span style={{ width: '30%', display: 'inline-block' }}>- Năm sinh: . . . . .</span>
                    </p>
                    <p>
                        <span> - Nghề nghiệp hiện nay: . . . . . . .</span>
                    </p>
                    <p> - Chỗ ở hiện nay: . . . .</p>
                </div>
            </div>

            <div>
                <p>
                    Tôi xin cam đoan bản khai sơ yếu lý lịch trên đúng sự thật, nếu có điều gì không đúng tôi chịu trách
                    nhiệm trước pháp luật về lời khai của mình.
                </p>
                <div className="modal_signature">
                    <p>
                        <span>Tp . . . .</span>
                        <span>ngày . . . .</span>
                        <span>tháng . . . .</span>
                        <span>năm . . . .</span>
                    </p>
                    <p>Người khai</p>
                    <p>{staffInfo.fullName.split(' ').slice(-1).join(' ')}</p>
                    <p>{staffInfo.fullName}</p>
                </div>
            </div>
        </div>
    );
}

export default CurriculumVitae;
