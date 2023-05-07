import React, { useEffect, useState } from "react"
import { Button, Form, Input, Modal, Row, Col, Upload, Image } from 'antd';
import { addTour, updateTour } from "./CreateStaffService";
import { toast } from "react-toastify";

toast.configure({
    autoClose: 1000,
    draggable: false,
    limit: 3,
    closeOnClick: true
});

const beforeUpload = (file) => {
    const isJpgOrPng = file.type === "image/jpeg" || file.type === "image/png" || file.type === "image/jpg";
    if (!isJpgOrPng) {
        alert("You can only upload JPG/PNG file!");
    }
    return isJpgOrPng;
}

const CreateStaffDialogAdd = (props) => {

    const { open, onCancel, item } = props
    const [form] = Form.useForm()

    const [fileImage, setFileImage] = useState()

    const submitForm = async (values) => {

        const newValue = {
            ...values,
            moTaTour: fileImage
        }

        if (item) {
            const res = await updateTour(item.id, newValue)
            if (res.status === 200) {
                toast.success("Sua thanh cong")
            } else {
                toast.error("Loi roi !!!!!!!!!!!!!!")
            }
        } else {
            const res = await addTour(newValue)
            if (res.status === 200) {
                toast.success("Them hanh cong")
            } else {
                toast.error("Loi roi !!!!!!!!!!!!!!")
            }
        }
        form.resetFields()
        onCancel()
    }

    const handleUpload = (event) => {
        console.log('Tên tệp tin:', event.file.name);
        setFileImage(event.file.name)
    }

    useEffect(() => {
        if (item) {
            form.setFieldsValue(item)
        }
    }, [])

    return (
        <Modal
            title="Them Tour"
            open={open}
            width={1000}
            style={{ height: 700 }}
            // onOk={handleOk} 
            onCancel={onCancel}
            footer={null}
        >
            <Form
                form={form}
                onFinish={submitForm}
                layout="vertical"
            >
                <Row gutter={[16, 16]}>
                    <Col span={18}>
                        <Form.Item
                            name="tenTour"
                            label="Ten tour"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    min: 10,
                                    message: "Ten tour phai it nhat 10 ky tu"
                                },
                                {
                                    pattern: /^[\p{L}\s]+$/u,
                                    message: "Không được có ký tự đặc biệt"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="phuongTien"
                            label="Phuong tien"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    min: 2,
                                    message: "Ten tour phai it nhat 2 ky tu"
                                },
                                {
                                    pattern: /^[\p{L}\s]+$/u,
                                    message: "Không được có ký tự đặc biệt và số"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>
                </Row>

                <Row gutter={[16, 16]}>
                    <Col span={6}>
                        <Form.Item
                            name="sltd"
                            label="So luong tour"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "So luong > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="xuatPhat"
                            label="Xuat phat"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    min: 3,
                                    message: "Ten tour phai it nhat 5 ky tu"
                                },
                                {
                                    pattern: /^[\p{L}\s]+$/u,
                                    message: "Không được có ký tự đặc biệt"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="soNgay"
                            label="So ngay"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "So ngay > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="soDem"
                            label="So dem"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "So dem > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>
                </Row>

                <Row gutter={[16, 16]}>
                    <Col span={6}>
                        <Form.Item
                            name="giaNguoiLon"
                            label="Gia nguoi lon"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "Gia > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="giaTreEm"
                            label="Gia tre em"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "Gia > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                    <Col span={6}>
                        <Form.Item
                            name="giaTreNho"
                            label="Gia tre nho"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    pattern: /^[1-9]\d*$/,
                                    message: "Gia > 0"
                                }
                            ]}
                        >
                            <Input type="number" />
                        </Form.Item>
                    </Col>

                </Row>

                <Row gutter={[16, 16]}>
                    <Col span={18}>
                        <Form.Item
                            name="lichTrinh"
                            label="Lich trinh"
                            rules={[
                                {
                                    required: true,
                                    message: "Bat buoc phai nhap"
                                },
                                {
                                    min: 10,
                                    message: "Ten tour phai it nhat 10 ky tu"
                                },
                                {
                                    pattern: /^[a-zA-Z0-9\s-]+$/,
                                    message: "Không được có ký tự đặc biệt"
                                }
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>
                </Row>

                <Row>
                    <Col span={8} className="image-info">
                        <Row>
                            <div className="avatar" >
                                <Image
                                    // src={fileImage ? fileImage?.toString() : "error"}
                                    src={fileImage && `http://127.0.0.1:8887/${fileImage}`}
                                    fallback="data:image/png;base64,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"
                                />
                                {/* <img src={data?.anhMot && `http://127.0.0.1:8887/${data.anhMot}`} alt="ing" /> */}
                            </div>
                        </Row>
                        <Row >
                            <Form.Item name="moTaTour">
                                <Upload
                                    name="moTaTour"
                                    action="https://www.mocky.io/v2/5cc8019d300000980a055e76"
                                    onChange={handleUpload}
                                    beforeUpload={beforeUpload}
                                    showUploadList={false}
                                >
                                    <Button >
                                        Thêm ảnh đại diện
                                    </Button>
                                </Upload>
                            </Form.Item>
                        </Row>
                    </Col>
                </Row>

                <Row justify={"center"}>
                    <Form.Item>
                        <Button type="primary" htmlType="submit">
                            Submit
                        </Button>
                    </Form.Item>
                </Row>
            </Form>
        </Modal>
    )
}

export default CreateStaffDialogAdd
